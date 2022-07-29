class ApplicationMailer < ActionMailer::Base
  ADDR_LIB_NOREPLY = 'lib-noreply@berkeley.edu'.freeze

  default from: ADDR_LIB_NOREPLY
end
