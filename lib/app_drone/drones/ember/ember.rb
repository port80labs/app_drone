module AppDrone
class Ember < Drone
  desc 'Installs ember.js for Rails'
  category :ux
  depends_on :bundle, :javascript
  param :app_skeleton, :boolean, info: 'build an Ember app skeleton'

  def align
    bundle.add 'ember-rails'
    javascript.pipeline 'ember'
    if param(:app_skeleton)
      javascript.pipeline 'ember/#{app_name}.js'
    end
  end

  def execute
    do! :install
  end

end
end
