module Api
    module V1
        class ImagesController < ApiApplicationController
        
            before_action :authenticate_request!
            def index
                images = Image.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Carga de imagenes', data: images},
                status: :ok
            end
            
            def show
                image = Image.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Carga la imagen', data: image},
                status: :ok
            end

            def create 
                image = Image.new(image_params)
                if image.save 
                    render json: {status: 'SUCCESS', message: 'imagen guardada', data: image}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'imagen no guardada', data: image}, status: :unprocessable_entity
                end
            end

            def destroy 
                image = Image.find(params[:id])
                image.destroy
                render json: {status: 'SUCCESS', message: 'imagen eliminada', data: image}, status: :ok
            end

            def update 
                image = Image.find(params[:id])
                if image.update_attributes(image_params)
                    render json: {status: 'SUCCESS', message: 'imagen editada', data: image}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'imagen no editada', data: image}, status: :unprocessable_entity
                end
            end

            private

            def image_params
                params.permit(:description, :picture)
            end

        end
    end
end
