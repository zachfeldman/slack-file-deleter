require 'slack'

slack_token = ENV['SLACK_TOKEN']

Slack.configure do |config|
  config.token = slack_token
end

while Slack.client.files_list["files"].count > 0
  Slack.client.files_list["files"].each do |file|
    Slack.client.files_delete({file: file["id"]})
    p "File #{file["name"]} deleted."
  end
end