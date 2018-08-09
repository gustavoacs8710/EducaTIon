module Api
    module V1
        class RegistrationController < ApiApplicationController
        
        respond_to :json
        def create
            user = User.new(user_params)
            if user.save
                render json: {status: 'SUCCESS', message: 'Usuario registrado',   user: {id: user.id, email: user.email, name: user.name, auth_token: JsonWebToken.encode({user_id: user.id})}, status: :ok}
            end

        end
        private
        def user_params
            params.permit(:name, :email, :password, :password_confirmation);
        end
        
        end
    end
end