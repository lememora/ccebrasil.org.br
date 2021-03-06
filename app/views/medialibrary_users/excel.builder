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
          xml.Cell { xml.Data 'Nascimento', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Sexo', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'CPF', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Fixo', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Celular', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Endereço', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Bairro', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Cidade', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Estado', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'CEP', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Necessidades Especiais', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Cuidados Especiais', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Interesses', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Nacionalidade', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'País', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Passaporte', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Instituição', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Cargo', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Unidade de Trabalho', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Atividades', 'ss:Type' => 'String' }
      end
      # Rows
      for medialibrary_user in @medialibrary_users
        xml.Row do
            xml.Cell { xml.Data medialibrary_user.name, 'ss:Type' => 'String' }
            xml.Cell { xml.Data medialibrary_user.email, 'ss:Type' => 'String' } 
            xml.Cell { xml.Data "#{medialibrary_user.nasc_dia}/#{medialibrary_user.nasc_mes}/#{medialibrary_user.nasc_ano}", 'ss:Type' => 'String' }
            xml.Cell { xml.Data medialibrary_user.sexo, 'ss:Type' => 'String' }
            xml.Cell { xml.Data medialibrary_user.cpf, 'ss:Type' => 'String' }
            xml.Cell { xml.Data "#{medialibrary_user.ddd_fixo} #{medialibrary_user.phone_fixo}", 'ss:Type' => 'String' }
            xml.Cell { xml.Data "#{medialibrary_user.ddd_celular} #{medialibrary_user.phone_celular}", 'ss:Type' => 'String' }
            xml.Cell { xml.Data medialibrary_user.end_residencial, 'ss:Type' => 'String' }
            xml.Cell { xml.Data medialibrary_user.end_residencial_bairro, 'ss:Type' => 'String' }
            xml.Cell { xml.Data medialibrary_user.end_residencial_cidade, 'ss:Type' => 'String' }
            xml.Cell { xml.Data medialibrary_user.end_residencial_estado, 'ss:Type' => 'String' }
            xml.Cell { xml.Data medialibrary_user.end_residencial_cep, 'ss:Type' => 'String' }   
            xml.Cell { xml.Data medialibrary_user.necessidades_especiais, 'ss:Type' => 'String' }
            xml.Cell { xml.Data medialibrary_user.cuidados_especiais, 'ss:Type' => 'String' }
            xml.Cell { xml.Data medialibrary_user.interesses, 'ss:Type' => 'String' }
            xml.Cell { xml.Data medialibrary_user.nacionalidade, 'ss:Type' => 'String' }
            xml.Cell { xml.Data medialibrary_user.pais, 'ss:Type' => 'String' }
            xml.Cell { xml.Data medialibrary_user.passaporte, 'ss:Type' => 'String' }
            xml.Cell { xml.Data medialibrary_user.instituicao, 'ss:Type' => 'String' }
            xml.Cell { xml.Data medialibrary_user.cargo, 'ss:Type' => 'String' }
            xml.Cell { xml.Data medialibrary_user.unidade_de_trabalho, 'ss:Type' => 'String' }
            xml.Cell { xml.Data medialibrary_user.atividades, 'ss:Type' => 'String' }
        end
      end
    end
  end
end
