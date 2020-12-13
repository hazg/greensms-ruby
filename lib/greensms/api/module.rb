require "greensms/utils/validator"

module GreenSMS
  module API
    class Module
      attr_reader :module_schema
      attr_reader :module_name
      attr_reader :function_name

      def initialize(rest_client, module_schema, kwargs, module_name, function_name)
        @rest_client = rest_client
        @module_schema = module_schema
        @module_name = module_name
        @function_name = function_name
        # if module_name == "call" and function_name == "send"
        # end
        @params = {}
        kwargs.each { |name, value| @params[name] = value }
      end

      def api_func(kwargs = {})

          puts "Schema Start ------"
          puts @module_name
          puts @function_name
          puts @module_schema
          puts @params['url']
          puts "Schema End ------"
        if !@module_schema.nil?
          errors = GreenSMS.validate(@module_schema, kwargs)
          if !errors.nil?
            return errors
          end
        end

        api_params = {}
        kwargs.each { |name, value| api_params[name] = value }
        request_params = @params.clone
        request_params["params"] = api_params

        response = @rest_client.request(request_params)
        return response
      end
    end
  end
end
