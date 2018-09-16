module RailsAdminPdf
end

require 'rails_admin/config/actions'
require 'prawn'

module RailsAdmin
  module Config
    module Actions
      class Pdf < Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :member do
          true
        end

        register_instance_option :pjax? do
          false
        end

        register_instance_option :controller do
          Proc.new do

            # Configurando PDF
            PDF_OPTIONS = {
              :page_size   => "A4",
              :page_layout => :portrait,
              :margin      => [40, 35]
            }

            # Configurando Retorno
            ramdom_file_name = (0...8).map { (65 + rand(26)).chr }.join
            # ramdom_file_name = (0...8).map { (65 + rand(26)).chr }.join

            Prawn::Document.new(PDF_OPTIONS) do |pdf|
              # pdf.stroke_axis

              pdf.image "public/anjos logo.png", :at => [0 , 650], :scale => 0.77
              pdf.text "ORGANIZAÇÃO NÃO GOVERNAMENTAL ANJOS PROTETORES", :size => 14, :style => :bold, :align => :center#, :at => [200, 750], :height => 100, :width => 250
              pdf.text "ADOÇÃO RESPONSÁVEL DE ANIMAL", :size => 14, :style => :bold, :align => :center
              pdf.text "TERMO DE RESPONSABILIDADE DE ADOÇÃO", :size => 14, :style => :bold, :align => :center
              pdf.move_down 40
              pdf.text "DADOS DO ADOTANTE", :size => 12, :style => :bold, :align => :left
              pdf.move_down 5
              if @object.tutor
                pdf.font_size 11 #Set tamanho font
                pdf.text "<b>Nome:</b> #{@object.tutor.name}, <b>CPF Nº</b> #{@object.tutor.cpf}", :inline_format => true, :align => :justify
                pdf.move_down 3
                pdf.text "<b>Endereço residencial:</b> #{@object.tutor.address}, <b>Bairro:</b> #{@object.tutor.neighborhood}", :inline_format => true, :align => :justify
                pdf.move_down 3
                pdf.text "<b>Cidade/UF:</b> #{@object.tutor.city} - #{@object.tutor.state} <b>Fone:</b> #{@object.tutor.phone}", :inline_format => true, :align => :justify
                pdf.move_down 3
                pdf.text "Endereço onde ficará o animal: (  ) o mesmo acima    (  ) outro: Qual?______________________", :align => :left
                pdf.move_down 5
                pdf.text "DADOS DO ANIMAL", :size => 12, :style => :bold, :align => :left
                pdf.move_down 5
                pdf.text "<b>Espécie:</b> #{@object.species}, <b>Sexo:</b> #{@object.gender}, <b>Idade:</b> #{@object.age} anos, <b>Castrado:</b> #{@object.castrated}, <b>Cor da Pelagem:</b> #{@object.color}", :inline_format => true, :align => :justify
                pdf.move_down 3
                pdf.text "<b>Vermifugado:</b> #{@object.dewormed}, <b>Vacinado:</b> #{@object.vaccinated}", :inline_format => true, :align => :justify
                pdf.move_down 10
                pdf.text "Ao adotar o animal acima descrito declaro-me apto para assumir a guarda e a responsabilidade sobre este animal, eximindo o doador de toda e qualquer responsabilidade por quaisquer atos praticados pelo animal a partir desta data.", :align => :justify
                pdf.text "Declaro ainda estar ciente de todos os cuidados que este animal exige no que se refere à sua guarda e manunteção, estando apto a guardá-lo e vigiá-lo, comprometendo-me a proporcionar <b><u>boas condições de alojamento e alimentação</u></b>, assim como, espaço físico que possibilite o animal se exercitar. Responsabilizo-me por preserva a saúde e integridade do animal e a submetê-lo aos cuidados médicos-veterinários sempre que necessário para este fim e <b><u>DAR TODAS AS VACINAS QUE PREVINEM VIROSES E DEMAIS DOENÇAS OCASIONADAS PELA OMISSÃO DAS MESMAS.</u></b>", :inline_format => true, :align => :justify
                pdf.text "Comprometo-me a não transmitir a posse deste animal a outrem sem o conhecimento do doador.", :align => :justify
                pdf.text "Comprometo-me a também, a permitir o acesso do doador ao local onde se encontra o animal para averiguação de suas condições.", :align => :justify
                pdf.text "Tenho conhecimento de que caso seja constatado por parte do doador situação inadequada para o bem-estar do animal, perderei a sua guarda, assumindo o risco de prejuízos judiciais conforme preconiza a <b>Lei de Crimes Ambientais nº. 9.605/98 Art. 32 Art. 32. Praticar ato de abuso, maus-tratos, ferir ou mutilar animais silvestres, domésticos, nativos ou exóticos. Com Pena - detenção, de tres meses a um ano, e multa.</b>", :inline_format => true, :align => :justify
                pdf.text "Comprometo-me ainda em ESTERILIZAR o animal adotado se o doador já não tiver feito, contribuindo assim para o controle da população de animais domésticos ou não deixar que o mesmo procrie irresponsavelmente.", :align => :justify
                pdf.text "Comprometo-me a cumprir toda a legislação vigente, municipal, estadual e federal, relativa à posse de animais.", :align => :justify
                pdf.move_down 5
                pdf.text "Declaro-me assim, ciente das normas acima, as quais aceito, assinando o presente Termo de responsabilidade, assumindo plenamente os deveres que dele constam, bem como outros relacionados à posse responsàvel e que não estejam incluídos neste termo.", :align => :justify
                pdf.move_down 35
                pdf.text "<b>_____________________________________              _____________________________________</b>", :inline_format => true, :align => :justify
                pdf.draw_text "DOADOR", :at => [100, 145]
                pdf.draw_text "ADOTANTE", :at => [350, 145]
                pdf.move_down 35
              end
              pdf.text "Macapá - AP, #{Time.now.day} de #{Time.now.strftime("%B")} de #{Time.now.year}", :align => :right
              pdf.move_down 30
              pdf.text "<u><b>Abandonar ou maltratar animais é crime!</u></b>", :inline_format => true, :align => :center
              pdf.text "<u><b>Pena 3 meses a 1 ano de dentenção e multa (Lei 9605/98)</u></b>", :inline_format => true, :align => :center
              pdf.move_down 3
              pdf.text "<u><b>Adotar uma animal é um ato digno de amor e humaninade.</u></b>", :inline_format => true, :align => :center

              # Muda de font para Helvetica
              # pdf.font "Helvetica"
              # Inclui um texto com um link clicável (usando a tag link) no bottom da folha do lado esquerdo e coloca uma cor especifica nessa parte (usando a tag color)
              # pdf.text "Link Para o Manul do Prawn<link href='http://prawnpdf.org/manual.pdf'> <color rgb='5ca3e6'>clicável</color></link>", :size => 10, :inline_format => true, :valign => :bottom, :align => :left
              # Inclui em baixo da folha do lado direito a data e o némero da página usando a tag page
              # pdf.number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página <page>", :start_count_at => 0, :page_filter => :all, :at => [pdf.bounds.right - 140, 7], :align => :right, :size => 8
              # Gera no nosso PDF e coloca na pasta public com o nome agreement.pdf
              pdf.render_file("public/#{ramdom_file_name}.pdf")
            end

            File.open("public/#{ramdom_file_name}.pdf", 'r') do |f|
              send_data f.read.force_encoding('BINARY'), :filename => 'pdf', :type => "application/pdf", :disposition => "attachment"
            end
            File.delete("public/#{ramdom_file_name}.pdf")
          end
        end

        register_instance_option :link_icon do
          'fa fa-file-pdf-o'
        end
      end
    end
  end
end
