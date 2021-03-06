# encoding: utf-8
module OntologyHelper
  
  def status(resource)
    html = content_tag :span, resource.state

    if %w(pending downloading processing).include? resource.state
      html << " " << image_tag('spinner-16x16.gif', class: 'spinner')
    end

    if resource.state == 'failed' and resource.is_a? Ontology
      version = resource.versions.last

      link = ' ('
      link << link_to('error',
        ontology_ontology_versions_path(resource),
        :'data-original-title' => version.last_error,
        class: 'help'
      )
      link << ')'

      html << content_tag(:span, link.html_safe, class: 'error')
    end

    html
  end

  def download_path(resource)
    return nil if resource.versions.done.empty?
    ontology_ontology_version_path(resource, resource.versions.done.latest.first)
  end
  
end
