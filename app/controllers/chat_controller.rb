class ChatController < ApplicationController
    include ActionController::Live

    skip_before_filter  :verify_authenticity_token

    def index

    end

    def events
      response.headers['Content-Type'] = 'text/event-stream'
      sse = Streamer::SSE.new(response.stream)
      redis = Redis.new
      redis.subscribe('messages.create') do |on|
        on.message do |event, data|
          sse.write(data, event: 'messages.create')
        end
      end
      render nothing: true
    rescue IOError
      # Client disconnected
    ensure
      redis.quit
      sse.close
    end

    def create
      response.headers['Content-Type'] = 'text/javascript'
      @message = params.require(:message).permit(:name, :content)
      $redis.publish('messages.create', @message.to_json)
      render nothing: true
    end

    def pub
        $redis.publish 'chat_event', params[:chat_data].to_json
        render json: {}, status: 200
    end

    def sub
        response.headers["Content-Type"] = "text/event-stream"

        redis = Redis.new
        redis.subscribe(['chat_event', 'heartbeat']) do |on|
            on.message do |event, data|
                response.stream.write "event: #{event}\ndata: #{data}\n\n"
            end
        end
    rescue IOError
        logger.info "Stream Closed"
    ensure
        redis.quit
        response.stream.close
    end


end