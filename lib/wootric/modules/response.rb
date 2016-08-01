class Wootric::Client
  module Response

    def responses(options={})
      responses = connection.get("responses") do |req|
        req.params['page'] = options[:page] unless options[:page].nil?
        req.params['per_page'] = options[:per_page] unless options[:per_page].nil?
        req.params['created[gt]'] = options[:gt] unless options[:gt].nil?
        req.params['created[lt]'] = options[:lt] unless options[:lt].nil?
        req.params['created[gte]'] = options[:gte] unless options[:gte].nil?
        req.params['created[lte]'] = options[:lte] unless options[:lte].nil?
        req.params['sort_order'] = options[:sort_order] unless options[:sort_order].nil?
      end

      responses_json = JSON.parse(responses.body)
      responses_json
    end

    def end_user_responses(end_user_id, options={})
      end_user_responses = connection.get("end_users/#{end_user_id}/responses") do |req|
        req.params['page'] = options[:page] unless options[:page].nil?
        req.params['per_page'] = options[:per_page] unless options[:per_page].nil?
        req.params['created[gt]'] = options[:gt] unless options[:gt].nil?
        req.params['created[lt]'] = options[:lt] unless options[:lt].nil?
        req.params['created[gte]'] = options[:gte] unless options[:gte].nil?
        req.params['created[lte]'] = options[:lte] unless options[:lte].nil?
      end
      end_user_response_json = JSON.parse(end_user_responses.body)
      end_user_response_json
    end

    def end_user_promoters_responses(end_user_id, options={})
      end_user_promoters_responses = connection.get("end_users/#{end_user_id}/responses/promoters") do |req|
        req.params['page'] = options[:page] unless options[:page].nil?
        req.params['per_page'] = options[:per_page] unless options[:per_page].nil?
        req.params['created[gt]'] = options[:gt] unless options[:gt].nil?
        req.params['created[lt]'] = options[:lt] unless options[:lt].nil?
        req.params['created[gte]'] = options[:gte] unless options[:gte].nil?
        req.params['created[lte]'] = options[:lte] unless options[:lte].nil?
      end
      end_user_promoters_response_json = JSON.parse(end_user_promoters_responses.body)
      end_user_promoters_response_json
    end

    def end_user_passives_responses(end_user_id, options={})
      end_user_passives_responses = connection.get("end_users/#{end_user_id}/responses/passives") do |req|
        req.params['page'] = options[:page] unless options[:page].nil?
        req.params['per_page'] = options[:per_page] unless options[:per_page].nil?
        req.params['created[gt]'] = options[:gt] unless options[:gt].nil?
        req.params['created[lt]'] = options[:lt] unless options[:lt].nil?
        req.params['created[gte]'] = options[:gte] unless options[:gte].nil?
        req.params['created[lte]'] = options[:lte] unless options[:lte].nil?
      end
      end_user_passives_response_json = JSON.parse(end_user_passives_responses.body)
      end_user_passives_response_json
    end

    def end_user_detractors_responses(end_user_id, options={})
      end_user_detractors_responses = connection.get("end_users/#{end_user_id}/responses/detractors") do |req|
        req.params['page'] = options[:page] unless options[:page].nil?
        req.params['per_page'] = options[:per_page] unless options[:per_page].nil?
        req.params['created[gt]'] = options[:gt] unless options[:gt].nil?
        req.params['created[lt]'] = options[:lt] unless options[:lt].nil?
        req.params['created[gte]'] = options[:gte] unless options[:gte].nil?
        req.params['created[lte]'] = options[:lte] unless options[:lte].nil?
      end
      end_user_detractors_response_json = JSON.parse(end_user_detractors_responses.body)
      end_user_detractors_response_json
    end

    def find_response(end_user_id, response_id)
      response = connection.get("end_users/#{end_user_id}/responses/#{response_id}")
      response_json = JSON.parse(response.body)
      binding.pry
      response_json
    end

    def create_response(end_user_id, score, ip_address, origin_url, options={})
      new_response = connection.post("end_users/#{end_user_id}/responses") do |req|
        req.params['score'] = score
        req.params['ip_address'] = ip_address
        req.params['origin_url'] = origin_url
        req.params['text'] = options[:text] unless options[:text].nil?
        req.params['create_at'] = options[:create_at] unless options[:create_at].nil?
      end
      new_response
    end

    def delete_response(end_user_id, response_id)
      delete_response = connection.delete("end_users/#{end_user_id}/responses/#{response_id}")
      deleted_response_json = JSON.parse(delete_response.body)
      deleted_response_json
    end
  end
end
