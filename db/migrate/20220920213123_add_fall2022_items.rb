class AddFall2022Items < ActiveRecord::Migration[7.0]
  DATA = [
    'MMSID,Barcode,Image,Thumbnail,Title,Artist,ArtistURL,Date,Decade,Description,Medium,Appearance,Genre 1,Genre 2,Dimensions,Size,Series,Circulation,Location,Value,AppraisalDate,Notes,Suppress',
    '991085987125406532,C103792028,Sato (Mask).jpg,Sato (Mask)_360px.jpg,The Mask Collector,"Sato, Rob",https://www.robsato.com/,2020,After 1999,"Printed by Tiny Splendor. From the exhibition ""Car Crash Picnic.""",Risograph,Color,Abstract,Figurative,"15.5 x 19""",Small,,,,,,,',
    '991085987125206532,C103791909,Breidenthal(Bat).jpg,Breidenthal(Bat)_360px.jpg,Bat Kiss,"Breidenthal, Elinor",,2020,After 1999,,Relief-Linocut,Black and White,Animals,,"16 x 16""",Small,,,,,,,',
    '991085987125106532,C103791893,Ryan(Untitled).jpg,Ryan(Untitled)_360px.jpg,When I Was Your Age This Was All Orchards,"Ryan, David",,2020,After 1999,3-color Riso print.,Risograph,Color,Figurative,,"18.5 x 15.5""",Small,,,,,,,',
    '991085987125006532,C103792152,Max(Poster2020).jpg,Max(Poster2020)_360px.jpg,East Bay Print Sale Poster 2020,"Takar, Kenny",https://maxsgaragepress.com/,2020,After 1999,"Poster advertising the 2020 East Bay Print Sale, run by Max\'s Garage Press.",Risograph,Color,Figurative,Text Based,"16 x 22""",Small,,,,,,,',
    '991085987141306532,C103791884,Hernandez(Yin).jpg,Hernandez(Yin)_360px.jpg,Yin Yang 69,"Hernandez, Hector",https://hectoromarhernandez.com/,2011,After 1999,Copperplate mezzotint. Edition of 5.,Intaglio-Mezzotint,Black and White,Animals,,"14.5 x 11""",Small,A/P,,,,,,',
    '991085987141206532,C103792286,Hernandez(Manual).jpg,Hernandez(Manual)_360px.jpg,Manual Labor,"Hernandez, Hector",https://hectoromarhernandez.com/,2008,After 1999,Copperplate mezzotint. Edition of 13.,Intaglio-Mezzotint,Black and White,Figurative,,"24 x 12""",Small,"""8/13""",,,,,,',
    '991085987134306532,C103792295,Hernandez(Skull).jpg,Hernandez(Skull)_360px.jpg,Untitled (Skull),"Hernandez, Hector",https://hectoromarhernandez.com/,2008,After 1999,Zinc aquatint mezzotint. Edition of 13.,Intaglio-Mezzotint,Black and White,Figurative,,"23 x 31.5""",Large,,,,,,,',
    '991085987140206532,C103792310,Neeley(Moss).jpg,Neeley(Moss)_360px.jpg,Moss Lord,"Neeley, Kathleen",https://www.kathleenneeley.com/,2020,After 1999,"Five-color multi-block linocut. Part of the series ""The Understory."" Signed, titled, and numbered.",Relief-Linocut,Color,Animals,,"21 x 24""",Medium,,,,,,,',
    '991085987124906532,ucb00155609,Neeley(Downstream).jpg,Neeley(Downstream)_360px.jpg,Downstream,"Neeley, Kathleen",https://www.kathleenneeley.com/,2021,After 1999,"Five-color multi-block linocut. Part of the series ""The Understory."" Signed, titled, and numbered.",Relief-Linocut,Color,Animals,,"21 x 24""",Medium,,,,,,,',
    '991085987140306532,C103792019,Wong(Pandora).jpg,Wong(Pandora)_360px.jpg,Pandora (Ink Kitten),"Wong, Anita",https://www.anitayanwong.com/,2021,After 1999,,Mixed media,Black and White,Animals,,"17 x 21.5""",Small,,,,,,,',
    '991085987140406532,C103795987,Hussong(Screenprinting).jpg,Hussong(Screenprinting)_360px.jpg,Screen Test Print ,"Hussong, Randy",https://www.randyhussong.com/,2011,After 1999,Design inspired by early television test patterns. Developed as a teaching aid for printmaking classes. ,Stencil-Serigraph,Color,,,"31 x 25""",Large,,,,,,,',
    '991085987135206532,C103796158,Hussong(Intaglio).jpg,Hussong(Intaglio)_360px.jpg,Intaglio Test Print ,"Hussong, Randy",https://www.randyhussong.com/,2012,After 1999,Design inspired by early television test patterns. Developed as a teaching aid for printmaking classes. ,Intaglio,Color,,,"31 x 25""",Large,,,,,,,',
    '991085987135106532,C103796291,Hussong(Lithography).jpg,Hussong(Lithography)_360px.jpg,Lithography Test Print ,"Hussong, Randy",https://www.randyhussong.com/,2013,After 1999,Design inspired by early television test patterns. Developed as a teaching aid for printmaking classes. ,Planographic-Lithograph,Color,,,"31 x 25""",Large,,,,,,,',
    '991085987134806532,C103796176,Hussong(Relief).jpg,Hussong(Relief)_360px.jpg,Relief Test Print ,"Hussong, Randy",https://www.randyhussong.com/,2017,After 1999,Design inspired by early television test patterns. Developed as a teaching aid for printmaking classes. ,Relief,Black and White,,,"31 x 25""",Large,,,,,,,',
    '991085987140606532,C103795835,McBride(Sinking).jpg,McBride(Sinking)_360px.jpg,Sinking,"McBride, Vera",,2020,After 1999,"Woodcut reduction. Signed, titled, and numbered.",Relief-Woodcut,Color,,,"19 x 25""",Medium,Artist\'s proof,,,,,,',
    '991085987140506532,C103795844,McBride(Trick).jpg,McBride(Trick)_360px.jpg,Trick of the Eye,"McBride, Vera",,2021,After 1999,"Signed, titled, and numbered.",Relief-Woodcut,Black and White,,,"16 x 20""",Small,"""2/15""",,,,,,',
    '991085987140706532,C103796228,Santamaria(Quetzalcoatl).jpg,Santamaria(Quetzalcoatl)_360px.jpg,Quetzalcoatl,"Sanchez Santamaria, Sergio",https://www.annexgalleries.com/artists/biography/4384/Santamaria/Sergio,2020,After 1999,"Signed, titled, and numbered.",Relief-Linocut,Color,,,"19 x 25""",Medium,,,,,,,',
    '991085987134706532,C103796024,Santamaria(Bajo).jpg,Santamaria(Bajo)_360px.jpg,Bajo el nopal,"Sanchez Santamaria, Sergio",https://www.annexgalleries.com/artists/biography/4384/Santamaria/Sergio,2020,After 1999,"Signed and numbered. From the portfolio ""Dioses y petates.""",Relief-Linocut,Color,,,"19 x 25""",Medium,,,,,,,',
    '991085987134606532,C103795880,Santamaria(Culebra).jpg,Santamaria(Culebra)_360px.jpg,Culebra en el Petate,"Sanchez Santamaria, Sergio",https://www.annexgalleries.com/artists/biography/4384/Santamaria/Sergio,2020,After 1999,"Signed and numbered. From the portfolio ""Dioses y petates.""",Relief-Linocut,Color,,,"19 x 25""",Medium,,,,,,,',
    '991085987134406532,C103795899,Santamaria(Encerrado).jpg,Santamaria(Encerrado)_360px.jpg,Dios Encerrado,"Sanchez Santamaria, Sergio",https://www.annexgalleries.com/artists/biography/4384/Santamaria/Sergio,2020,After 1999,"Signed and numbered. From the portfolio ""Dioses y petates.""",Relief-Linocut,Color,,,"19 x 25""",Medium,,,,,,,',
    '991085987140806532,C103796237,Santamaria(Mascara).jpg,Santamaria(Mascara)_360px.jpg,Mascara de Guerrero,"Sanchez Santamaria, Sergio",https://www.annexgalleries.com/artists/biography/4384/Santamaria/Sergio,2020,After 1999,"Signed and numbered. From the portfolio ""Dioses y petates.""",Relief-Linocut,Color,,,"19 x 25""",Medium,,,,,,,',
    '991085987140906532,C103796282,Lininger(Archae).jpg,Lininger(Archae)_360px.jpg,Archae Birds,"Lininger, Richard",https://art.famsf.org/richard-lininger,1973,1970-1979,"Signed, titled, and numbered.",Planographic-Lithograph,Color,Animals,,"26 x 17""",Medium,"""8/50""",,,,,,',
    '991085987141106532,C103796015,Curt(Untitled).jpg,Curt(Untitled)_360px.jpg,Untitled (Composition),"Curt, Rolf",https://fr.wikipedia.org/wiki/Rolf_Curt,1959,1950-1959,Signed and dated.,Intaglio-Etching,Color,,,"21.5 x 28""",Medium,Artist\'s proof,,,,,,',
    '991085985042206532,C103796219,Gui(Remnant).jpg,Gui(Remnant)_360px.jpg,Remnant,"Gui, Emily",http://emilygui.com/,2022,After 1999,,Stencil-Serigraph,Color,,,"26.25 x 22.5""",Medium,,,,,,,',
    '991085987134206532,C103796264,Okona(Landing).jpg,Okona(Landing)_360px.jpg,Lunar Landing,"Okona, Chinwe",https://www.chinweokona.com/,2022,After 1999,"4-color screen print; printed on jet black suede mat board. Signed, numbered, and dated.",Stencil-Serigraph,Black and White,,,"25 x 20.5""",Medium,,,,,,,',
    '991085987134006532,C103796121,Mubarak(2350).jpg,Mubarak(2350)_360px.jpg,2350 B.C.E.,"Mubarak, Cinque",https://cinque-mubarak.com/,2021,After 1999,12-color screen print. Signed and numbered.,Stencil-Serigraph,Color,,,"17 x 31""",Large,,,,,,,',
    '991085987133906532,C103795996,Falco(Noche).jpg,Falco(Noche)_360px.jpg,La Noche,"Falco, Robert",https://robertfalcostudio.com/,2019,After 1999,2-color screen print. Signed.,Stencil-Serigraph,Color,,,"29.5 x 23""",Large,,,,,,,',
    '991085987124806532,C103796130,Westerman(Oaks).jpg,Westerman(Oaks)_360px.jpg,Valley Oaks,"Westerman, Donna",https://viola-bagpipe-6ml9.squarespace.com/,[2020],After 1999,Woodcut reduction.,Stencil-Serigraph,Black and White,,,"32 x 30""",Large,,,,,,,',
    '991085987124706532,C103795853,Paabus(Passage).jpg,Paabus(Passage)_360px.jpg,Passage,"Paabus, Kristina",https://kristinapaabus.com/home.html,2021,After 1999,Signed by artist.,Monotype,Color,,,"24 x 29""",Large,,,,,,,',
    '991085987124606532,C103796273,Jo(RIP).jpg,Jo(RIP)_360px.jpg,RIP 2020,"Jo, Hellen",https://helllllen.org/,2021,After 1999,"5-color Riso print. Printed at Tiny Splendor in Oakland, CA. Signed and dated.",Risograph,Color,Figurative,,"18 x 22""",Medium,,,,,,,',
    '991085987124506532,C103795862,Sun(Dark).jpg,Sun(Dark)_360px.jpg,Dark Images,"Sun, Deth P",https://www.dethpsun.com/,2021,After 1999,"Printed at Tiny Splendor in Oakland, CA. Signed and dated.",Risograph,Color,Animals,,"18 x 22""",Medium,,,,,,,',
    '991085987124406532,C103796006,Takar(Back).jpg,Takar(Back)_360px.jpg,Back Peace,"Takar, Kenny",,2021,After 1999,"Printed at Tiny Splendor in Oakland, CA. Signed and dated.",Risograph,Color,Figurative,,"18 x 22""",Medium,,,,,,,'
  ]

  def up
    return if Rails.env.test?

    raise ArgumentError, "Missing images:\n\t#{image_errors.join("\n\t")}" if image_errors.any?
    ActiveRecord::Base.connection.reset_pk_sequence!('items', :id, 'items_id_seq')
    importer.import_items!
  end

  def down
    return if Rails.env.test?

    Item.where(mms_id: mms_ids).destroy_all
  end

  private

  def importer
    @importer ||= Importer.new(DATA.join("\n"))
  end

  def image_errors
    importer.image_errors
  end

  def mms_ids
    @mms_ids ||= DATA.filter_map { |line| line.scan(/^9910\d+6532/).first }
  end
end
