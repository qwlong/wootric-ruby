class Wootric::Client
  module Decline

    def declines(options={})
      declines = connection.get("declines") do |req|
        add_filter_params(req, options)
        add_pagination_params(req, options)
      end

      JSON.parse(declines.body)
    end

    def end_user_declines(end_user_id, options={})
      end_user_declines = connection.get("end_users/#{end_user_id}/declines") do |req|
        add_filter_params(req, options)
      end
      JSON.parse(end_user_declines.body)
    end

    def find_decline(end_user_id, decline_id)
      decline = connection.get("end_users/#{end_user_id}/declines/#{decline_id}")
      JSON.parse(decline.body)
    end

    def create_decline(end_user_id, options={})
      new_decline = connection.post("end_users/#{end_user_id}/declines") do |req|
        add_filter_params(req, options)
        add_pagination_params(req, options)
        req.params['origin_url'] = options[:origin_url] unless options[:origin_url].nil?
      end
      new_decline
    end

    def delete_decline(end_user_id, decline_id)
      delete_decline = connection.delete("end_users/#{end_user_id}/declines/#{decline_id}")
      JSON.parse(delete_decline.body)
    end
  
  private
  
    def add_pagination_params(req, options)
      req.params['page'] = options[:page] if options[:page].present?
      req.params['per_page'] = options[:per_page] if options[:per_page].present?
    end

    def add_filter_params(req, options)
      req.params['created[gt]'] = options[:gt] if options[:gt].present?
      req.params['created[lt]'] = options[:lt] if options[:lt].present?
      req.params['created[gte]'] = options[:gte] if options[:gte].present?
      req.params['created[lte]'] = options[:lte] if options[:lte].present?
    end
  end
end
