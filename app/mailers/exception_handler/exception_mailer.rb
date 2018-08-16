module ExceptionHandler
  class ExceptionMailer < ActionMailer::Base

      # Layout
      layout "mailer"

      # Defaults
      default from: 			    ExceptionHandler.config.email
      default template_path: 	"exception_handler/mailers" # => http://stackoverflow.com/a/18579046/1143732

      def new_exception e
      	@exception = e
        @show_trace = ExceptionHandler.config.show_trace
        mail to: ExceptionHandler.config.email
        Rails.logger.info "Exception Sent To → #{ExceptionHandler.config.email}"
      end
  end
end
