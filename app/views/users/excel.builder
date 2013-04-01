xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8" 
xml.Workbook({
  'xmlns'      => "urn:schemas-microsoft-com:office:spreadsheet", 
  'xmlns:o'    => "urn:schemas-microsoft-com:office:office",
  'xmlns:x'    => "urn:schemas-microsoft-com:office:excel",    
  'xmlns:html' => "http://www.w3.org/TR/REC-html40",
  'xmlns:ss'   => "urn:schemas-microsoft-com:office:spreadsheet" 
  }) do

  xml.Worksheet 'ss:Name' => 'Clientes' do
    xml.Table do
      # Header
      xml.Row do
          xml.Cell { xml.Data 'Nome', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Email', 'ss:Type' => 'String' }          
          xml.Cell { xml.Data 'Área de atuação', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Deseja receber a newsletter', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Endereço Residencial', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Bairro', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Cidade', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Estado', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'CEP', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Telefone', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Telefone', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Homepage', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Atividade Profissional', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Empresa', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Endereço Comercial', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Bairro', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Cidade', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Estado', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'CEP', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Cargo na Empresa', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Área Atuçãoo da Empresa', 'ss:Type' => 'String' }
      end
      # Rows
      for user in @users
        xml.Row do
            xml.Cell { xml.Data user.name, 'ss:Type' => 'String' }
            xml.Cell { xml.Data user.email, 'ss:Type' => 'String' }             
            xml.Cell { xml.Data user.activity, 'ss:Type' => 'String' } 
            xml.Cell { xml.Data user.deseja_receber, 'ss:Type' => 'String' } 
            xml.Cell { xml.Data user.endereco_residencial, 'ss:Type' => 'String' } 
            xml.Cell { xml.Data user.bairro_residencial, 'ss:Type' => 'String' } 
            xml.Cell { xml.Data user.cidade_residencial, 'ss:Type' => 'String' } 
            xml.Cell { xml.Data user.uf_residencial, 'ss:Type' => 'String' } 
            xml.Cell { xml.Data user.cep_residencial, 'ss:Type' => 'String' } 
            xml.Cell { xml.Data "#{user.phone_1_kind} #{user.phone_1_number}", 'ss:Type' => 'String' } 
            xml.Cell { xml.Data "#{user.phone_2_kind} #{user.phone_2_number}", 'ss:Type' => 'String' }
            xml.Cell { xml.Data user.homepage, 'ss:Type' => 'String' }   
            xml.Cell { xml.Data user.atividade_profissional, 'ss:Type' => 'String' } 
            xml.Cell { xml.Data user.empresa, 'ss:Type' => 'String' }
            xml.Cell { xml.Data user.endereco_comercial, 'ss:Type' => 'String' } 
            xml.Cell { xml.Data user.bairro_comercial, 'ss:Type' => 'String' }
            xml.Cell { xml.Data user.cidade_comercial, 'ss:Type' => 'String' }
            xml.Cell { xml.Data user.uf_comercial, 'ss:Type' => 'String' }
            xml.Cell { xml.Data user.cep_comercial, 'ss:Type' => 'String' }
            xml.Cell { xml.Data user.cargo_na_empresa, 'ss:Type' => 'String' }
            xml.Cell { xml.Data user.area_atuacao_da_empresa, 'ss:Type' => 'String' }
        end
      end
    end
  end
end
