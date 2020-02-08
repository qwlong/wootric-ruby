class Wootric::Client
  module EndUser

    def end_users(options={})
      users = connection.get("end_users") do |req|
        req = add_pagination_params(req, options)
        req = add_filter_params(req, options)
      end

      users_json = JSON.parse(users.body)
      users_json
    end

    def find_end_user(user_id)
      user = connection.get("end_users/#{user_id}")
      user_json = JSON.parse(user.body)
      user_json
    end

    def create_end_user(email, options={})
      new_user = connection.post("end_users") do |req|
        req.params['email'] = email
        req.params['last_surveyed'] = options[:last_surveyed] unless options[:last_surveyed].nil?
        req.params['properties[company]'] = options[:company] unless options[:company].nil?
        req.params['properties[city]'] = options[:city] unless options[:city].nil?
      end
      new_user_json = JSON.parse(new_user.body)
      new_user_json
    end

    def edit_end_user(user_id, options={})
      edit_user = connection.put("end_users/#{user_id}") do |req|
        req.params['email'] = options[:email] unless options[:email].nil?
        req.params['last_surveyed'] = options[:last_surveyed] unless options[:last_surveyed].nil?
        req.params['external_created_at'] = options[:external_created_at] unless options[:external_created_at].nil?
        req.params['properties[company]'] = options[:company] unless options[:company].nil?
        req.params['properties[city]'] = options[:city] unless options[:city].nil?
      end
      new_user_json = JSON.parse(edit_user.body)
      new_user_json
    end

    def delete_end_user(user_id)
      user = connection.delete("end_users/#{user_id}")
      user_json = JSON.parse(user.body)
      user_json
    end

    private

    def add_pagination_params(req, options)
      req.params['page'] = options[:page] if options[:page]
      req.params['per_page'] = options[:per_page] if options[:per_page]
    end

    def add_filter_params(req, options)
      req.params['created[gt]'] = options[:gt] if options[:gt]
      req.params['created[lt]'] = options[:lt] if options[:lt]
      req.params['created[gte]'] = options[:gte] if options[:gte]
      req.params['created[lte]'] = options[:lte] if options[:lte]
    end

  end
end
