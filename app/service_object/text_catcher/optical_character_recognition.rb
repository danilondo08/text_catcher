module TextCatcher
  class OpticalCharacterRecognition
    include ActiveModel::Model
    require 'httparty'
    # require 'net/http'
    # require 'base64'


    attr_accessor :photo

    validates_presence_of :photo

    def initialize(args)
      # @user_id = args.fetch(:user_id, nil)
      @photo = args.fetch(:photo, nil)
      @authorization = 'Token'
    end

    def perform
      if self.valid?
        send_character_recognition_request
     else
        return false
      end
    end

    private


    def send_character_recognition_request
      url = 'http://192.168.123.109:3000/api/v1/imageup'
      image_file = photo.tempfile.open.read.force_encoding(Encoding::UTF_8) 
      data = Base64.encode64(image_file)
      result = ::HTTParty.post(url, 
        :body => { :message => "data:#{photo.content_type};base64,#{data}"
                 }.to_json,
        :headers => { 'Content-Type' => 'application/json' } )
      
      puts data
      # raise
      # req_body = {message: data}
      # resp, rdata = https.post(uri.path, data.to_json, headers)
      # puts resp
      # body = JSON.parse(resp.body)
      
      # if  ["201","200"].include?(resp.code)
        
      # else
        
      #   error = JSON.parse(resp.body)&.[]("Errors")&.first&.[]("Message")
      #   message = "Creation of elisa invoice in Siigo Nube failed."
        
      # end
    end
  end
end