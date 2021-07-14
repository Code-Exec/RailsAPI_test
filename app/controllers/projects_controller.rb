class ProjectsController < ApplicationController

    def_param_group :project do
        param :name, String, :required => true
    end

    api :POST, '/projects/', 'Create new roject'
    def create 
        project = Project.new(in_params)
        if project.save
            render jsonapi: project, status: 201
        else
            render jsonapi: {errors: project.errors}, status: :unprocessable_entity
        end
    end

    api :GET, '/projects/', 'Show all projects'
    def index
        projects = Project.all
        render jsonapi: projects, status: :ok
    end

    api :GET, '/projects/:id', 'Show one project'
    def show
        project = Project.find(params[:id])
        render jsonapi: project, status: :ok
    end

    api :PUT, '/projects/:id', 'Update selected project data'
    def update
        project = Project.find(params[:id])
        if project.update(in_params)
            render jsonapi: project, status: :ok
        else
            render jsonapi: {errors: project.errors}, status: :unprocessable_entity
        end
    end      
    
    api :DELETE, '/projects/:id', 'Delete selected project'
    def destroy
        project = Project.find(params[:id])
        project.destroy
        render jsonapi: project, status: 204
    end

    def extract_options
        {option: 'some'}
    end

    private

        def in_params
            { 
                name: params.require(:name)
            }
        end    
end