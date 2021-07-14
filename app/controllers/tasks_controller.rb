class TasksController < ApplicationController
    
    api :POST, '/project/:id/tasks/', 'Create current task in project'
    def create
        task = find_proj(params[:project_id]).tasks.new(in_params)

        if task.save
            render jsonapi: task, status: 201
        else
            render jsonapi: {errors: task.errors}, status: :unprocessable_entity
        end
    end

    api :GET, '/project/:id/tasks/:id', 'Show current task in project'
    def index
        tasks = find_proj(params[:project_id]).tasks.order("priority DESC")
        render jsonapi: tasks, status: :ok
    end

    api :GET, '/project/:id/tasks/', 'Show all tasks in project'
    def show
        task = Task.where(id: params[:id], project_id: params[:project_id]).first
        render jsonapi: task, status: :ok
    end

    api :PUT, '/project/:id/tasks/:id', 'Update current task in project'
    def update
        task = Task.find(params[:id])
        if task.update(in_params)
            render jsonapi: task, status: :ok
        else
            render jsonapi: {errors: task.errors}, status: :unprocessable_entity
        end
    end

    api :DELETE, '/project/:id/tasks/:id', 'Delete current task in project'
    def destroy
        task = Task.find(params[:id])
        task.destroy
        render jsonapi: task, status: 204
    end

    private

        def in_params
            {
                project_id: params.require(:project_id),
                name: params[:name]
            }#permit(:name, :subject, :done)
        end

        def find_proj proj_id
            Project.find(proj_id.to_i)
        end
end