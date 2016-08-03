class Wootric::Client
  module EndUserSetting

    def end_user_settings(end_user_id)
      settings = connection.get("end_users/#{end_user_id}/settings")
      settings_json = JSON.parse(settings.body)
      settings_json
    end

    def update_user_settings(end_user_id, nps_email)
      new_settings = connection.put("end_users/#{end_user_id}/settings") do |req|
        req.params['email_nps'] = nps_email unless nps_email.nil?
      end
      new_settings_json = JSON.parse(new_settings.body)
      new_settings_json
    end

  end
end
