module ProgramsHelper
  
  def add_attribute_link(name)
    link_to_function name do |page| 
      page.insert_html :bottom, :attributes, :partial => "program_generic_attribute", :object => ProgramGenericAttribute.new
    end
  end
  
end
