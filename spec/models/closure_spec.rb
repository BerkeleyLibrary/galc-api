require 'rails_helper'

RSpec.describe Closure, type: :model do

  def compare_closures(a, b)
    order = compare_end_dates(a, b)
    return -order if order != 0

    a.start_date <=> b.start_date
  end

  def compare_end_dates(a, b)
    order = (a_end_date = a.end_date) <=> b.end_date
    order || (a_end_date.nil? ? 1 : -1)
  end

  describe :create do
    it 'requires start date to be before end date' do
      closure = Closure.create(note: 'Backwards', start_date: Date.current, end_date: Date.current - 1.days)
      expect(closure).not_to be_valid
      expect(closure).not_to be_persisted
    end

    it 'coerces dates to local date' do
      start_date = Date.new(2021, 8, 18)
      end_date = Date.new(2021, 12, 17)
      expected_start_date = Date.new(2021, 8, 18)
      expected_end_date = Date.new(2021, 12, 17)
      closure = Closure.create(note: 'Fall 2021', start_date: start_date, end_date: end_date)
      expect(closure).to be_valid # just to be sure
      expect(closure).to be_persisted # just to be sure

      expect(closure.start_date).to eq(expected_start_date)
      expect(closure.end_date).to eq(expected_end_date)
    end

    it 'coerces times to date' do
      start_date = Time.new(2021, 8, 18, 0, 0, 0, Closure::TIMEZONE)
      end_date = Time.new(2021, 12, 17, 23, 59, 59, Closure::TIMEZONE)
      expected_start_date = Date.new(2021, 8, 18)
      expected_end_date = Date.new(2021, 12, 17)
      closure = Closure.create(note: 'Fall 2021', start_date: start_date, end_date: end_date)
      expect(closure).to be_valid # just to be sure
      expect(closure).to be_persisted # just to be sure

      expect(closure.start_date).to eq(expected_start_date)
      expect(closure.end_date).to eq(expected_end_date)

      closure.reload

      expect(closure.start_date).to eq(expected_start_date)
      expect(closure.end_date).to eq(expected_end_date)
    end

    it 'handles weird time zones, not that we should see any' do
      start_date = Date.new(2021, 5, 19).in_time_zone('Asia/Tokyo')
      end_date = Date.new(2021, 5, 21).in_time_zone('Pacific/Marquesas')
      expected_start_date = Date.new(2021, 5, 18)
      expected_end_date = Date.new(2021, 5, 21)

      closure = Closure.create(note: 'Fall 2021', start_date: start_date, end_date: end_date)
      expect(closure).to be_valid # just to be sure
      expect(closure).to be_persisted # just to be sure

      expect(closure.start_date).to eq(expected_start_date)
      expect(closure.end_date).to eq(expected_end_date)

      closure.reload

      expect(closure.start_date).to eq(expected_start_date)
      expect(closure.end_date).to eq(expected_end_date)
    end
  end

  describe :current do

    let(:today_in_tz) { Time.now.in_time_zone(Closure::TIMEZONE).to_date }

    it 'includes the currently active closure' do
      closure = create(:closure, note: 'Test 1', start_date: today_in_tz - 1.days, end_date: today_in_tz + 1.days)
      expect(closure).to be_persisted # just to be sure

      expect(closure).to be_current
      expect(Closure.current).to include(closure)
    end

    it 'includes closures starting today' do
      closure = create(:closure, note: 'Test 1', start_date: today_in_tz, end_date: today_in_tz + 1.days)
      expect(closure).to be_current
      expect(Closure.current).to include(closure)
    end

    it 'does not include closures ending today' do
      closure = create(:closure, note: 'Test 1', start_date: today_in_tz - 1.days, end_date: today_in_tz)
      expect(closure).not_to be_current
      expect(Closure.current).not_to include(closure)
    end

    it 'does not include future definite closures' do
      closure = create(:closure, note: 'Test 1', start_date: today_in_tz + 1.days, end_date: today_in_tz + 2.days)
      expect(closure).not_to be_current
      expect(Closure.current).not_to include(closure)
    end

    it 'does not include future indefinite closures' do
      closure = create(:closure, note: 'Test 1', start_date: today_in_tz + 1.days, end_date: nil)
      expect(closure).not_to be_current
      expect(Closure.current).not_to include(closure)
    end

    it 'includes indefinite closures' do
      closure = create(:closure, note: 'Test 1', start_date: today_in_tz - 1.days, end_date: nil)
      expect(closure).to be_persisted # just to be sure

      expect(closure).to be_current
      expect(Closure.current).to include(closure)
    end

    it 'is empty if there is no currently active closure' do
      Closure.where(end_date: nil).destroy_all

      closure = create(:closure, note: 'Test 1', start_date: today_in_tz - 3.days, end_date: today_in_tz - 1.days)
      expect(closure).to be_persisted # just to be sure

      expect(closure).not_to be_current
      expect(Closure.current).not_to exist
    end

    it 'sorts closures in descending order by end date' do
      closures = [
        [today_in_tz - 2.days, today_in_tz + 1.days],
        [today_in_tz - 1.days, today_in_tz + 1.days],
        [today_in_tz - 1.days, today_in_tz + 2.days],
        [today_in_tz - 5.days, today_in_tz + 3.days]
      ].map do |start_date, end_date|
        create(:closure, start_date: start_date, end_date: end_date)
      end
      closures.sort! { |a, b| compare_closures(a, b) }

      expect(Closure.current.to_a).to eq(closures)
    end

    it 'sorts indefinite closures before definite ones' do
      closures = [
        [today_in_tz - 1.days, nil],
        [today_in_tz - 2.days, today_in_tz + 1.days],
        [today_in_tz - 1.days, today_in_tz + 2.days],
        [today_in_tz - 5.days, today_in_tz + 3.days]
      ].map do |start_date, end_date|
        create(:closure, start_date: start_date, end_date: end_date)
      end
      closures.sort! { |a, b| compare_closures(a, b) }

      expect(Closure.current.to_a).to eq(closures)
    end

    context 'with time zones' do
      attr_reader :env_tz_actual
      attr_reader :rails_tz_actual

      before do
        @env_tz_actual = ENV['TZ']
        @rails_tz_actual = Time.zone
      end

      after do
        ENV['TZ'] = env_tz_actual
        Time.zone = rails_tz_actual
      end

      it 'works regardless of the ENV time zone' do
        closure = create(:closure, note: 'Test 1', start_date: today_in_tz - 1.days, end_date: today_in_tz + 1.days)
        %w[UTC America/Los_Angeles].each do |tz|
          ENV['TZ'] = tz
          expect(closure).to be_current
        end
      end
    end
  end

  describe :future do
    it 'returns future closures' do
      closure = create(:closure, note: 'Test 1', start_date: Date.current + 1.days, end_date: Date.current + 2.days)
      expect(closure).to be_persisted # just to be sure

      expect(closure).to be_future
      expect(Closure.future).to include(closure)
    end

    it 'includes indefinite closures' do
      closure = create(:closure, note: 'Test 1', start_date: Date.current + 1.days, end_date: nil)
      expect(closure).to be_persisted # just to be sure

      expect(closure).to be_future
      expect(Closure.future).to include(closure)
    end

    it 'sorts closures in descending order by end date' do
      closures = [
        [Date.current + 1, Date.current + 3],
        [Date.current + 2, Date.current + 4],
        [Date.current + 1, Date.current + 2],
        [Date.current + 5, Date.current + 6]
      ].map do |start_date, end_date|
        create(:closure, start_date: start_date, end_date: end_date)
      end
      closures.sort! { |a, b| compare_closures(a, b) }

      expect(Closure.future.to_a).to eq(closures)
    end

    it 'sorts indefinite closures before definite ones' do
      closures = [
        [Date.current + 1, nil],
        [Date.current + 2, Date.current + 4],
        [Date.current + 1, Date.current + 2],
        [Date.current + 5, Date.current + 6]
      ].map do |start_date, end_date|
        create(:closure, start_date: start_date, end_date: end_date)
      end
      closures.sort! { |a, b| compare_closures(a, b) }

      expect(Closure.future.to_a).to eq(closures)
    end
  end

  describe :past do
    it 'returns past closures' do
      closure = create(:closure, note: 'Test 1', start_date: Date.current - 3.days, end_date: Date.current - 1.days)
      expect(closure).to be_persisted # just to be sure

      expect(closure).to be_past
      expect(Closure.past).to include(closure)
    end

    it 'includes closures ended today' do
      closure = create(:closure, note: 'Test 1', start_date: Date.current - 3.days, end_date: Date.current)
      expect(closure).to be_persisted # just to be sure

      expect(closure).to be_past
      expect(Closure.past).to include(closure)
    end

    it 'does not include indefinite closures' do
      closure = create(:closure, note: 'Test 1', start_date: Date.current - 1.days, end_date: nil)
      expect(closure).to be_persisted # just to be sure

      expect(closure).not_to be_past
      expect(Closure.past).not_to include(closure)
    end

    it 'sorts closures in descending order by end date' do
      closures = [
        [Date.current - 3, Date.current - 1],
        [Date.current - 4, Date.current - 2],
        [Date.current - 2, Date.current - 1],
        [Date.current - 6, Date.current - 5]
      ].map do |start_date, end_date|
        create(:closure, start_date: start_date, end_date: end_date)
      end
      closures.sort! { |a, b| compare_closures(a, b) }

      expect(Closure.past.to_a).to eq(closures)
    end
  end

  describe :filtered do
    before do
      [
        [Date.current + 1, Date.current + 2],
        [Date.current + 1, nil],
        [Date.current + 2, Date.current + 4],
        [Date.current + 5, Date.current + 6],
        [Date.current - 1, Date.current + 2],
        [Date.current - 1, nil],
        [Date.current - 2, Date.current + 1],
        [Date.current - 2, Date.current - 1],
        [Date.current - 3, Date.current - 1],
        [Date.current - 4, Date.current - 2],
        [Date.current - 5, Date.current + 3],
        [Date.current - 6, Date.current - 5]
      ].map do |start_date, end_date|
        create(:closure, start_date: start_date, end_date: end_date)
      end
    end

    it 'returns all closures when filter is empty' do
      filter = {}
      expected = Closure.all

      result = Closure.filter_by(filter).to_a
      expected_in_order = expected.to_a.sort! { |a, b| compare_closures(a, b) }
      expect(result).to eq(expected_in_order)
    end

    context 'excluding' do
      it 'can exclude past and future' do
        filter = {
          past: false,
          future: false
        }
        expected = Closure.current

        result = Closure.filter_by(filter).to_a
        expected_in_order = expected.to_a.sort! { |a, b| compare_closures(a, b) }
        expect(result).to eq(expected_in_order)
      end

      it 'can exclude past and current' do
        filter = {
          past: false,
          current: false
        }

        expected = Closure.future

        result = Closure.filter_by(filter).to_a
        expected_in_order = expected.to_a.sort! { |a, b| compare_closures(a, b) }
        expect(result).to eq(expected_in_order)
      end

      it 'can exclude current and future' do
        filter = {
          future: false,
          current: false
        }

        expected = Closure.past

        result = Closure.filter_by(filter).to_a
        expected_in_order = expected.to_a.sort! { |a, b| compare_closures(a, b) }
        expect(result).to eq(expected_in_order)
      end

      it 'returns nothing when everything is excluded' do
        filter = {
          past: false,
          current: false,
          future: false
        }
        result = Closure.filter_by(filter).to_a
        expect(result).to be_empty
      end
    end

    context 'including' do
      it 'can include past and future' do
        filter = {
          past: true,
          future: true
        }
        expected = Closure.not_current

        result = Closure.filter_by(filter).to_a
        expected_in_order = expected.to_a.sort! { |a, b| compare_closures(a, b) }
        expect(result).to eq(expected_in_order)
      end

      it 'can include past and current' do
        filter = {
          past: true,
          current: true
        }

        expected = Closure.not_future

        result = Closure.filter_by(filter).to_a
        expected_in_order = expected.to_a.sort! { |a, b| compare_closures(a, b) }
        expect(result).to eq(expected_in_order)
      end

      it 'can include current and future' do
        filter = {
          future: true,
          current: true
        }

        expected = Closure.not_past

        result = Closure.filter_by(filter).to_a
        expected_in_order = expected.to_a.sort! { |a, b| compare_closures(a, b) }
        expect(result).to eq(expected_in_order)
      end

      it 'returns everything when everything is included' do
        filter = {
          past: true,
          current: true,
          future: true
        }

        expected = Closure.all

        result = Closure.filter_by(filter).to_a
        expected_in_order = expected.to_a.sort! { |a, b| compare_closures(a, b) }
        expect(result).to eq(expected_in_order)
      end
    end

    context 'mixed' do
      it "can mix 2 include/exclude conditions (not that it's clear why you'd want to)" do
        filter = {
          past: true,
          current: false
        }
        expected = Closure.past

        result = Closure.filter_by(filter).to_a
        expected_in_order = expected.to_a.sort! { |a, b| compare_closures(a, b) }
        expect(result).to eq(expected_in_order)
      end

      it "can mix 2 include + 1 exclude conditions (not that it's clear why you'd want to)" do
        filter = {
          past: true,
          future: true,
          current: false
        }
        expected = Closure.not_current

        result = Closure.filter_by(filter).to_a
        expected_in_order = expected.to_a.sort! { |a, b| compare_closures(a, b) }
        expect(result).to eq(expected_in_order)
      end

      it "can mix 2 exclude + 1 exclude conditions (not that it's clear why you'd want to)" do
        filter = {
          past: false,
          future: false,
          current: true
        }
        expected = Closure.current

        result = Closure.filter_by(filter).to_a
        expected_in_order = expected.to_a.sort! { |a, b| compare_closures(a, b) }
        expect(result).to eq(expected_in_order)
      end
    end
  end

  describe :reopen_date do
    it 'returns nil if there is no current closure' do
      expect(Closure.current).not_to exist # just to be sure
      expect(Closure.reopen_date).to be_nil
    end

    it 'returns nil if the current closure is indefinite' do
      create(:closure, start_date: Date.current - 1, end_date: nil)
      expect(Closure.reopen_date).to be_nil
    end

    it 'returns the end date if the current closure is definite' do
      expected_date = Date.current + 1
      create(:closure, start_date: Date.current - 1, end_date: expected_date)
      expect(Closure.reopen_date).to eq(expected_date)
    end

    it 'returns the latest end date if there are multiple overlapping closures' do
      [
        [Date.current - 1, Date.current + 1],
        [Date.current - 2, Date.current + 1],
        [Date.current - 1, Date.current + 2],
        [Date.current - 5, Date.current + 3]
      ].each do |start_date, end_date|
        create(:closure, start_date: start_date, end_date: end_date)
      end

      expected_date = Closure.current.maximum(:end_date)
      expect(Closure.reopen_date).to eq(expected_date)
    end

    it 'returns nil if any current closure is indefinite' do
      [
        [Date.current - 1, nil],
        [Date.current - 2, Date.current + 1],
        [Date.current - 1, Date.current + 2],
        [Date.current - 5, Date.current + 3]
      ].each do |start_date, end_date|
        create(:closure, start_date: start_date, end_date: end_date)
      end

      expect(Closure.reopen_date).to be_nil
    end
  end
end
