module Neteller
  class Order
    attr_accessor :merchant_ref_id

    def initialize(options={})
      options.each { |name, value| instance_variable_set("@#{name}", value) } unless options.nil?
    end

    def to_h
      {
        order: {
          merchantRefId: @merchant_ref_id,
          totalAmount: @total_amount,
          currency: @currency,
          lang: @lang,
          redirects: [
            {
              rel: "on_success",
              returnKeys: [],
              uri: @redirects_success
            },
            {
              rel: "on_cancel",
              returnKeys: [],
              uri: @redirects_cancel
            }
          ],
          items: @items || [],
          paymentMethods: @payment_methods || []
        }
      }
    end
  end
end
