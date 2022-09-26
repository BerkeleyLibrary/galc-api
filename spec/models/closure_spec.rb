require 'rails_helper'

RSpec.describe Closure, type: :model do
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
      start_date = Time.zone.local(2021, 8, 18)
      end_date = Time.zone.local(2021, 12, 17, 23, 59, 59)
      expected_start_date = Date.new(2021, 8, 18)
      expected_end_date = Date.new(2021, 12, 17)
      closure = Closure.create(note: 'Fall 2021', start_date: start_date, end_date: end_date)
      expect(closure).to be_valid # just to be sure
      expect(closure).to be_persisted # just to be sure

      expect(closure.start_date).to eq(expected_start_date)
      expect(closure.end_date).to eq(expected_end_date)
    end
  end

  # TODO: make sure these all still work after midnight UTC
  describe :current do
    it 'includes the currently active closure' do
      closure = create(:closure, note: 'Test 1', start_date: Date.current - 1.days, end_date: Date.current + 1.days)
      expect(closure).to be_persisted # just to be sure

      expect(closure).to be_current
      expect(Closure.current).to include(closure)
    end

    it 'includes closures starting today' do
      closure = create(:closure, note: 'Test 1', start_date: Date.current, end_date: Date.current + 1.days)
      expect(closure).to be_current
      expect(Closure.current).to include(closure)
    end

    it 'does not include closures ending today' do
      closure = create(:closure, note: 'Test 1', start_date: Date.current - 1, end_date: Date.current)
      expect(closure).not_to be_current
      expect(Closure.current).not_to include(closure)
    end

    it 'includes indefinite closures' do
      closure = create(:closure, note: 'Test 1', start_date: Date.current - 1.days, end_date: nil)
      expect(closure).to be_persisted # just to be sure

      expect(closure).to be_current
      expect(Closure.current).to include(closure)
    end

    it 'is empty if there is no currently active closure' do
      Closure.where(end_date: nil).destroy_all

      closure = create(:closure, note: 'Test 1', start_date: Date.current - 3.days, end_date: Date.current - 1.days)
      expect(closure).to be_persisted # just to be sure

      expect(closure).not_to be_current
      expect(Closure.current).not_to exist
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
        closure = create(:closure, note: 'Test 1', start_date: Date.current - 1.days, end_date: Date.current + 1.days)
        %w[UTC America/Los_Angeles].each do |tz|
          ENV['TZ'] = tz
          expect(closure).to be_current
        end
      end
    end
  end
end
