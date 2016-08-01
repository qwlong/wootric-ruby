class Wootric::Client
  module Decline

    def declines(options={})
      declines = connection.get("declines") do |req|
        req.params['page'] = options[:page] unless options[:page].nil?
        req.params['per_page'] = options[:per_page] unless options[:per_page].nil?
        req.params['created[gt]'] = options[:gt] unless options[:gt].nil?
        req.params['created[lt]'] = options[:lt] unless options[:lt].nil?
        req.params['created[gte]'] = options[:gte] unless options[:gte].nil?
        req.params['created[lte]'] = options[:lte] unless options[:lte].nil?
      end

      declines_json = JSON.parse(declines.body)
      declines_json
    end

    def end_user_declines(end_user_id, options={})
      end_user_declines = connection.get("end_users/#{end_user_id}/declines") do
        req.params['page'] = options[:page] unless options[:page].nil?
        req.params['per_page'] = options[:per_page] unless options[:per_page].nil?
        req.params['created[gt]'] = options[:gt] unless options[:gt].nil?
        req.params['created[lt]'] = options[:lt] unless options[:lt].nil?
        req.params['created[gte]'] = options[:gte] unless options[:gte].nil?
        req.params['created[lte]'] = options[:lte] unless options[:lte].nil?
      end
      end_user_decline_json = JSON.parse(end_user_declines.body)
      end_user_decline_json
    end

    def find_decline(end_user_id, decline_id)
      decline = connection.get("end_users/#{end_user_id}/declines/#{decline_id}")
      decline_json = JSON.parse(decline.body)
      decline_json
    end

    def create_decline(end_user_id, options={})
      new_decline = connection.post("end_users/#{end_user_id}/declines") do |req|
        req.params['created[gt]'] = options[:gt] unless options[:gt].nil?
        req.params['created[lt]'] = options[:lt] unless options[:lt].nil?
        req.params['created[gte]'] = options[:gte] unless options[:gte].nil?
        req.params['created[lte]'] = options[:lte] unless options[:lte].nil?
        req.params['origin_url'] = options[:origin_url] unless options[:origin_url].nil?
      end
      new_decline
    end

    def delete_decline(end_user_id, decline_id)
      delete_decline = connection.delete("end_users/#{end_user_id}/declines/#{decline_id}")
      deleted_decline_json = JSON.parse(delete_decline.body)
      deleted_decline_json
    end
  end
end
