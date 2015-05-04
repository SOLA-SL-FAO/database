--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = system, pg_catalog;

--
-- Data for Name: br; Type: TABLE DATA; Schema: system; Owner: postgres
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE br DISABLE TRIGGER ALL;

INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('application-br2-check-title-documents-not-old', 'application-br2-check-title-documents-not-old', 'sql', 'The scanned image of the title should be less than one week old.::::Отсканированная копия права собственности должна быть сделана менее недели назад.::::عمر صورة السند الممسوح يجب ان تكون اقل من أسبوع::::L''image scannée du titre ne doit pas être antérieur à une semaine.::::እስካንድ የሆነው የይዞታ መብት ማረጋገጫ ሰነድ ምስል ከአንድ ሳምንት ያነሰ ዕድሜ ሊኖረው ይገባል', 'NOT USED BY SOLA STATE LAND', 'Checks recorded date (recordation) against date at time of validation. Current allowable date difference is one week.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('ba_unit-has-cadastre-object', 'BA030', 'sql', 'Property must have an associated parcel::::::::::::::::ንብረት ተያያዥ ቁራሽ መሬት የግድ ሊኖረው ይገባል', NULL, '#{id}(administrative.ba_unit.id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('application-verifies-identification', 'application-verifies-identification', 'sql', 'Personal identification verification should be attached to the application.::::Персональный идентификационный документ должен быть прикреплен к заявлению.::::يجب ارفاق وثائق التعريف الشخصية مع الطلب::::La vérification de l''identité personnelle doit être attachée à la demande.::::ከማመልከቻው ጋር የማንነት ማረጋገጫ መታወቂያ መያያዝ አለበት', 'NOT USED BY SOLA STATE LAND', '#{id}(application.application.id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('bulk-spatial-geom-overlaps-with-loading-geom', 'bulk-spatial-geom-overlaps-with-loading-geom', 'sql', 'New cadastre objects must not overlap with other new cadastre objects. ::::Новые кадастровые объекты не должны пересекаться с другими новыми объектами.::::::::::::አዲስ የካዳስተር ኦብጀክቶች ከሌሎች አዲስ ካዳስተር ኦብጀክቶች መደራረብ የለባቸውም', NULL, '#{id}(transaction_id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('app-check-title-ref', 'app-check-title-ref', 'sql', 'Invalid identifier for title::::Неверный идентификатор права собственности::::معرف السند غير صحيح::::Identifiant invalide pour le titre::::ያልጸና የይዞታ መብት ማረጋገጫ መለያ', 'NOT USED BY SOLA STATE LAND', '');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('bulk-spatial-name-unique', 'bulk-spatial-name-unique', 'sql', 'Cadastre objects with must have unique names.::::Кадастровые объекты должны иметь уникальные коды.::::::::::::የካዳስተር ኦብጄክቶች ልዩ ስም ሊኖራቸው የግድ ነው  ', NULL, '#{id}(transaction_id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('bulk-spatial-geom-overlaps-with-existing', 'bulk-spatial-geom-overlaps-with-existing', 'sql', 'Cadastre objects must not overlap with existing cadastre objects. ::::Кадастровые объекты не должны пересекаться с существующими кадастровыми объектами.::::::::::::የካዳስተር ኦብጀክቶች አሁን ካሉ የካዳስተር ኦብጄክቶች መደራረብ የለባቸውም', NULL, '#{id}(transaction_id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('bulk-spatial-geom-not-valid', 'bulk-spatial-geom-not-valid', 'sql', 'Cadastre objects must have a valid closed polygon. ::::Кадастровые объекты должны иметь корректный завершенный полигон.::::::::::::የካዳስተር ኦብጀክቶች የፀና ዝግ ፖሊጎን ሊኖራቸው የግድ ነው', NULL, '#{id}(transaction_id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('application-br3-check-properties-are-not-historic', 'application-br3-check-properties-are-not-historic', 'sql', 'All the titles identified for the application must be current.::::Все права собственности, относящиеся к заявлению должны иметь текущий (активный) статус.::::جميع سندات الملكية داخل الطلب يجب ان  تكون حالية::::Tous les titres identifiés pour la demande doivent être courants.::::ማመልከቻ ለሚቀርብባቸው የተለዩ ሁሉንም የይዞታ መብት ማረጋገጫ ሰነዶች የግድ ወቅታዊ መሆን አለባቸው', 'NOT USED BY SOLA STATE LAND', 'Checks the title reference recorded at lodgement against titles in the database and if there is a ba_unit record it checks if it is current (PASS)');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('application-on-approve-check-services-status', 'application-on-approve-check-services-status', 'sql', 'All tasks in the job must have the status Cancelled or Completed.::::::::::::::::ሁሉንም የአንድ ስራ ዝርዝር ክንውኖች የተሰረዘ ወይም የተጠናቀቀ ደረጃ የግድ ይኖርባቸዋል', NULL, 'Checks the service.status_code for all instances of service related to the application');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('application-br8-check-has-services', 'AP040', 'sql', 'A job must have at least one task::::::::::::::::ሥራው ቢያንስ አንድ ክንውን ሊኖረው የግድ ይላል', NULL, 'Checks that an application has at least one service. When this rule fails you should add a service to the application or cancel the application.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('generate-application-nr', 'generate-application-nr', 'sql', '...::::::::...::::::::...', NULL, '');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('generate-notation-reference-nr', 'generate-notation-reference-nr', 'sql', '', NULL, '');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('generate-rrr-nr', 'generate-rrr-nr', 'sql', '', NULL, '');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('generate-source-nr', 'generate-source-nr', 'sql', '', NULL, '');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('generate-baunit-nr', 'generate-baunit-nr', 'sql', '', NULL, '');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('generate-cadastre-object-lastpart', 'generate-cadastre-object-lastpart', 'sql', '', NULL, 'It accepts parameters #{geom} = The geometry of the new cadastre object and #{cadastre_object_type} = The type of the cadastre object.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('generate-cadastre-object-firstpart', 'generate-cadastre-object-firstpart', 'sql', '', NULL, 'It accepts parameters #{last_part} = The last part of the identifier and #{cadastre_object_type} = The type of the cadastre object.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('generate-spatial-unit-group-name', 'generate-spatial-unit-group-name', 'sql', '', NULL, 'It accepts parameters: 
  #{geom_v} = The geometry of the new spatial unit group. It is in EWKB format.
  #{hierarchy_level_v} = The hierarchy level
  #{label_v} = The label
  ');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('generate-claim-nr', 'generate-claim-nr', 'sql', '', '', '');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('applicant-name-to-owner-name-check', 'applicant-name-to-owner-name-check', 'sql', 'The applicants name should be the same as (one of) the current owner(s)::::Имя заявителя должно быть таким же как у одного из текущих владельцев.::::مقدم الطلب يجب ان يكون واحد من المالكين الحاليين::::Le nom d''au moins un des propriétaires actuels doivent apparaître parmis les demandeurs.::::አመልካቾቹ ከወቅቱ ባለሃብቶች (ከአንደኛቸው) ጋር ተመሳሳይ መሆን ይኖርባቸዋል ', 'NOT USED BY SOLA STATE LAND', '#{id}(application.application.id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('spatial-unit-group-name-unique', 'spatial-unit-group-name-unique', 'sql', 'Spatial unit groups must be unique.::::Пространственные группы должны быть уникальны.::::::::::::የቦታ አሀድ ስብስቦች የግድ ልዩ መሆን አለባቸው', 'NOT USED BY SOLA STATE LAND', 'There is no parameter required.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('baunit-has-multiple-mortgages', 'baunit-has-multiple-mortgages', 'sql', 'For the Register Mortgage service the identified title has no existing mortgages::::Для регистрации ипотеки указанная недвижимость не должна иметь существующих записей об ипотеки.::::في خدمة  تسجيل  رهن  السند المحدد لا يجب ان يكون عليه رهونات اخرى::::Pour le service d''enregistrement de l''hypothèque, le titre identifié n''a pas d''hypothèques existantes.::::ለዋስትና  መዝግብ አገልግሎቱ፤ የተለየው የይዞታ መብት ማረጋገጫ ሰነድ በአሁኑ ጊዜ ዋስትናዎች የሉበትም', 'NOT USED BY SOLA STATE LAND', '#{id}(administrative.ba_unit.id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('application-approve-cancel-old-titles', 'application-approve-cancel-old-titles', 'sql', 'An application including a new freehold service must also terminate the parent title(s) with a cancel title service.::::Identificati titoli esistenti. Prego terminare i titoli esistenti usando il servizio di Cancellazione Titolo::::الطلب الذي يحتوي على خدمة  تملك حر يجب ان يحتوي على خدمة اخرى تلغي جميع سندات الملكية السابقة::::Une demande incluant un nouveau service de propriété franche doit aussi résilier le(s) titre(s) parent(s) avec un service d''annulation.::::An application including a new freehold service must also terminate the parent title (s) with a cancel title service. ', 'NOT USED BY SOLA STATE LAND', '');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('application-br6-check-new-title-service-is-needed', 'application-br6-check-new-title-service-is-needed', 'sql', 'An application can be associated with a property which should have a digital title record.::::Заявление должно содержать недвижимость которая имеет электронную запись в базе.::::الطلب يجب ارتباطه بملكية لها سند ملكية الكتروني::::Une demande peut être associée à une propriété qui doit avoir une trace de titre numérique.::::አንድ ማመልከቻ ድጂታል የይዞታ መብት ማረጋገጫ ሪኮርድ ካለው ንብረት ሊገናኝ ይችላል', 'NOT USED BY SOLA STATE LAND', 'Rule checks to see if there is a ba_unit record for the property identified for the application at lodgement');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('public-display-check-baunit-has-co', 'public-display-check-baunit-has-co', 'sql', 'All property must have an associated cadastre object.::::Все объекты недвижимости должны иметь соответствующие кадастровые объекты.::::::::::::ሁሉንም ንብረት ተያያዥ ካዳስተር ኦብጀከት ሊኖረው የግድ ነው', 'NOT USED BY SOLA STATE LAND', '#{lastPart}(name_lastpart) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('application-br1-check-required-sources-are-present', 'application-br1-check-required-sources-are-present', 'sql', 'All documents required for the services in this application are present.::::Все документы, необходимые для указанных услуг должны присутствовать в заявлении.::::جميع الوثائق المطلوبة للخدمة  موجودة::::Tous les documents requis pour les services de cette demande sont présents.::::በዚህ ማመልከቻ ለተጠየቁት አገልግሎቶች የሚያስፈልጉ ሰነዶች በሙሉ ተሟልቷል', 'NOT USED BY SOLA STATE LAND', 'Checks that all required documents for any of the services in an application are recorded. Null value is returned if there are no required documents');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('app-title-has-primary-right', 'app-title-has-primary-right', 'sql', 'A single primary right (such as ownership) must be identified whenever a new title record is created::::Единственное право собственности должно быть зарегистрировано для нового объекта недвижимости.::::يجب تحديد حق اساسي وحيد  عند انشاء سند ملكية جديد::::Un unique droit principal (tel que la propriété) doit être identifié lorsqu''un nouveau titre est créé.::::አዲስ የይዞታ መብት ሪኮርድ በሚቋቋምበት ጊዜ አንድ ነጠላ ዋና መብት (እንደ ባለሀብትነት ያለ) የግድ መለየት አለበት', 'NOT USED BY SOLA STATE LAND', '#{id}(application.application.id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('cadastre-redefinition-target-geometries-dont-overlap', 'cadastre-redefinition-target-geometries-dont-overlap', 'sql', 'New polygons do not overlap with each other.::::Новые полигоны не пересекаются друг с другом.::::المضلعات الجديدة لا يجب ان تتداخل::::Les nouveaux polygones ne doivent pas se superposer.::::እርስ በራሳቸው የማይደራረቡ አዲስ ፖሊጎኖች', 'NOT USED BY SOLA STATE LAND', '#{id} is the parameter asked. It is the transaction id.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('power-of-attorney-owner-check', 'power-of-attorney-owner-check', 'sql', 'Name of person identified in Power of Attorney should match a (one of the) current owner(s)::::Имя лица указанного в доверенности должно совпадать с именем одного из владельцев.::::الاسم المحدد في الوكالة يجب ان يطابق احد اسماء المالكين::::Le nom de la personne identifiée dans la procuration doit correspondre à un des propriétaires actuels.::::በውክልና ሰነዱ ላይ የተመለከተው ሰው ስም ከአሁኑ ባለሀብቶች ወይም አንዳቸው ሥም ጋር አንድ መሆን ይኖርበታል', 'NOT USED BY SOLA STATE LAND', '#{id}(application.service.id)');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('service-title-terminated', 'service-title-terminated', 'sql', 'For the service ''req_type'' the title must be terminated (after all rights recorded on the title are transferred or cancelled).::::Для услуги ''req_type''  недвижимость должна быть ликвидирована (после того как все зарегистрированные права переданы или отменены).::::لخدمة من نوع     ''req_type'' , سند  الملكية يجب انهاؤه (بعد نقل الحقوق او الغاؤها (::::Pour le service ''req_type'', le titre doit être résilié (après que tous les droits enregistrés sur le titre soient transférés ou annulés).::::ለ''አርኪው_ዓይነት'' አገልግሎት የይዞታ መብት ማረጋገጫ ሰነዱ የግድ ቀሪ እንዲሆን ያስፈልጋል (ሁሉንም በይዞታ መብት ማረጋገጫ ሰነዱ ላይ ሪኮርድ የተደረጉት መብቶች ከተላለፉ ወይም ከተሰረዙ በኋላ)', 'NOT USED BY SOLA STATE LAND', '#{id}(application.service.id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('application-br7-check-sources-have-documents', 'AP190', 'sql', 'Documents lodged with a job should have a scanned image file (or other source file) attached; _$doc_list::::::::::::::::ለስራ የሚቀርቡ ማመልከቻዎች ስካንድ ምስል ፋይል (ወይም ሌላ ምንጭ ፋይል) በአባሪነት ሊኖራቸው ይገባል፤ _ብርሰነድ_ዝርዝር ', 'Updated for State Land', 'Checks that each document lodged with the application has a scanned image file (or other digital source file) stored in the SOLA database. To remedy the failure of the business rule add the scanned image to the document record through the Document Tab in the Application form or use the Document Toolbar item in the Main form.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('current-rrr-for-variation-or-cancellation-check', 'current-rrr-for-variation-or-cancellation-check', 'sql', 'For cancellation or variation of rights (or restrictions), there must be existing rights or restriction (in addition to the primary (ownership) right)::::Для изменения или отмены права или ограничения, должно существовать право или ограничение (в дополнении к основному праву собственности).::::من اجل الغاء او تغيير الحقوق او القيود , يجب اولا وجود حقوق او قيود سابقة بالاضافة الى تعريف الحق الاساسي::::Pour l''annulation ou la variation de droits (ou restrictions), il doit y avoir des droits (ou restrictions) existants (en plus du droit principal (propriété)).::::ለመብቶች (ገደቦች) ስረዛ ወይም ማሻሻያ በወቅቱ መብቶች ወይም ገደብ ሊኖር የግድ ይላል (ከዋናው/ባለሀብትነት መብት በተጨማሪ)', 'NOT USED BY SOLA STATE LAND', '#{id}(application.service.id)');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('documents-present', 'documents-present', 'sql', 'Documents attached to the objects, created or modified through the service, must have a scanned image file (or other source file)::::Документы прикреплённые к объектам, созданные или измененные через услуги, должны иметь прикрепленную отсканированную копию.::::المستندات المرفقة للكائنات، التي تم إنشاؤها أو تعديلها من خلال هذه الخدمة، يجب أن يكون لديها ملف الصورة الممسوحة ضوئيا (أو ملف مصدر آخر::::Les documents attaché à des objets, créés ou modifiés à travers un service, doivent contenir un fichier d''image scannée (ou fichier d''une autre source).::::ከኦብጀክቶች አባሪ የሆኑ ሰለዶች (በአገልግሎት ሂደት የተቋቋሙ ወይም የተሻሻሉ) ስካንድ ምስል ፋይል (ወይም ሌላ ምንጭ ፋይል) ሊኖራቸው የግድ ይላል', 'NOT USED BY SOLA STATE LAND', '#{id}(service_id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('application-br4-check-sources-date-not-in-the-future', 'AP160', 'sql', 'Document date must not be in the future; _$doc_list::::::::::::::::የሰነዱ ቀን ወደፊት መሆን የለበትም፤ _ብርሰነድ_ዝርዝር', NULL, 'Checks the date of the document as recorded at lodgement (source.recordation) and checks it is not a date in the future');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('ba_unit-has-caveat', 'ba_unit-has-caveat', 'sql', 'Caveat should not prevent registration proceeding.::::Арест не должен ограничивать дальнейшую регистрацию.::::القيود لا يجب ان تعطل عملية التسجيل::::Un caveat ne doit pas empêcher de procéder à l''enregistrement.::::የእክል ማስጠንቀቂያ ምዝገባ እንዳይቀጥል መከልከል የለበትም ', 'NOT USED BY SOLA STATE LAND', '#{id}(administrative.rrr.id) is requested.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('application-not-transferred', 'application-not-transferred', 'sql', 'An application should not be already transferred to another system.::::::::::::::::ማመልከቻው ወደ ሌላ ሥርዓት የተዛወረ መሆን የለበትም', 'NOT USED BY SOLA STATE LAND', 'It checks if the application has no service that is of type recordTransfer and that is completed.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('application-spatial-unit-not-transferred', 'application-spatial-unit-not-transferred', 'sql', 'An application must not use a parcel already transferred.::::::::::::::::አንድ ማመልከቻ የተላለፈ ቁራሽ መሬት መመልከት የለበትም', 'NOT USED BY SOLA STATE LAND', 'It checks if the application has no spatial_unit that is already targeted by an application that has a service of type recordTransfer.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('survey-points-present', 'survey-points-present', 'sql', 'There are at least 3 survey points present::::По крайней мере должны быть определены 3 точки съемки.::::هناك على الاقل ثلاث نقاط مساحة موجودة::::Il doit y avoir au moins 3 points de levé.::::ቢያንስ ሶስት የቅየሳ ነጥቦች ተገኝተዋል', 'NOT USED BY SOLA STATE LAND', '#{id}(transaction_id) is requested. Check there are survey points attached with the cadastre change.
 At least 3 points has to be attached to complete a polygon.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('target-parcels-check-isapolygon', 'target-parcels-check-isapolygon', 'sql', 'The union of the target parcels must be a polygon::::Объединение целевых участков должно быть полигоном.::::الاتحاد بين القطع يجب ان يكون مضلع::::L''union des parcelles cibles doit être un polygone.::::የሚመለከታቸው የቁራሽ መሬቶች ውህደት የግድ ፖሊጎን ሊሆን ይገባል', 'NOT USED BY SOLA STATE LAND', '#{id}(cadastre.cadastre_object.transaction_id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('target-and-new-union-the-same', 'target-and-new-union-the-same', 'sql', 'The union of new parcel polygons is the same with the union of the target parcel polygons::::Объединение полигонов новых участков должно быть таким же как форма полигонов целевых участков.::::الاتحاد بين مضلعات القطعة الجديدة يساوي الاتحاد بين مضلعات القطعة المستهدفة::::L''union des polygones des nouvelles parcells est le même que l''union des polygones des parcelles cibles.::::የአዲሶቹ የቁራሽ መሬት ፖሊጎኖች ውህደት ከሚመለከታቸው የቁራሽ መሬት ውህድ ፖሊጎኖች ጋር ተመሳሳይ ነው', 'NOT USED BY SOLA STATE LAND', '#{id}(transaction_id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('ba_unit-has-several-mortgages-with-same-rank', 'ba_unit-has-several-mortgages-with-same-rank', 'sql', 'The rank of a new mortgage must not be the same as an existing mortgage registered on the same title::::Рейтинг новой ипотеки не должен быть таким же как у существующей ипотеки для данной недвижимости.::::رتبة الرهن يجب ان لا تساوي نفس رتبة الرهن  الحالي::::Le rang de la nouvelle hypothèque ne doit pas être le même qu''une hypothèque existante enregistrée sur le même titre.::::የአንድ አዲስ ዋስትና ደረጃ በዚያው ንብረት ላይ ካለ ነባር ዋስትና ጋር ተመሳሳይ መሆን የለበትም', 'NOT USED BY SOLA STATE LAND', '#{id}(administrative.rrr.id) is requested.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('target-parcels-present', 'target-parcels-present', 'sql', 'Target parcel(s) must be selected::::Целевые участки должны быть выбраны.::::يجب اختيار القطعة المستهدفة::::Le(s) parcelle(s) doivent être sélectionnées.::::የሚመለከታቸው ቁራሽ መሬቶች የግድ ሊመረጡ ይገባል', 'NOT USED BY SOLA STATE LAND', '#{id}(transaction_id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('source-attach-in-transaction-no-pendings', 'source-attach-in-transaction-no-pendings', 'sql', 'Document (source file) must not be duplicated::::Документ не должен дублироваться.::::يجب عدم تكرار الوثيقة  (ملف المصدر)::::Le document (fichier source) ne doit pas être dupliqué.::::ሰነድ (ምንጭ ፋይል) መባዛት የለበትም ', 'NOT USED BY SOLA STATE LAND', '#{id}(source.source.id) is requested. It checks if the source has already a record with the status pending.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('mortgage-value-check', 'mortgage-value-check', 'sql', 'For the Register Mortgage service, the new mortgage is for less than the reported value of property (at time application was received)::::Сумма зарегистрированной ипотеки, меньше чем заявленная стоимость недвижимости (во время подачи заявления).::::في خدمة تسجيل رهن قيمة الرهن يجب ان تكون اقل قيمة الملكية  وقت استلام الطلب::::Pour le service d''enregistrement d''un hypothèque, la nouvelle hypothèque est inférieure à la valeur déclarée de la propriété (au moment où la demande a été reçue).::::ለዋስትና መዝግብ አገልግሎት፤ አዲሱ ዋስትና ሪፖርት ከተደረገው ንብረት ዋጋ ያንሳል (ማመልከቻው በተደረሰበት ጊዜ)', 'NOT USED BY SOLA STATE LAND', '#{id}(application.service.id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('document-supporting-rrr-is-current', 'document-supporting-rrr-is-current', 'sql', 'Documents supporting rights (or restrictions) must have current status::::Документы использующиеся для регистрации прав или ограничений должны иметь текущий (активный) статус.::::الوثائق التي تدعم الحقوق او القيود يجب ان يكون لها الحالة الحالية::::Les documents justificatifs de droits (ou restrictions) doivent avoir le statut courant.::::መብቶች ወይም ገደቦች የሚያስረዱ ሰነዶች ወቅታዊነት ሊኖራቸው የግድ ይላል', 'NOT USED BY SOLA STATE LAND', '#{id}(application.service.id)');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('public-display-check-complete-status', 'public-display-check-complete-status', 'sql', 'At least 90% of the parcels must have an associated Systematic Application with complete status.::::По крайней мере 90% участков должны иметь соответствующие заявления на системную регистрацию с завершенным статусом.::::::::::::ቢያንስ 90 % የሚሆኑት ቁራሽ መሬቶች የተጠናቀቀ ደረጃ ያለው ተያያዥ አጠቃላይ ማመልከቻ ሊኖራቸው የግድ ይላል', 'NOT USED BY SOLA STATE LAND', '#{lastPart}(name_lastpart) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('required-sources-are-present', 'required-sources-are-present', 'sql', 'All documents required for the service ''req_type'' are present.::::Должны присутствовать все документы необходимые для услуги ''req_type'' .::::جميع الوثائق المطلوبة لخدمة  ''req_type''  موجودة::::Tous les documents requis pour le service ''req_type'' sont présents.::::ለአርኤኪው_ዓይነት አገልግሎት የሚያስፈልጉ ሁሉንም ሰነዶች ቀርበዋል', 'NOT USED BY SOLA STATE LAND', 'Checks that all required documents for any of the services in an application are recorded. Null value is returned if there are no required documents');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('application-baunit-check-area', 'AP240', 'sql', 'Title has the same area as the combined area of its associated parcels::::Недвижимость должна иметь такую же площадь как все ее земельные участки.::::المساحة المعرفة في سند الملكية تساوي مجموع مساحات القطع لهذه المنطقة::::Le titre a la même superficie que la superficie combinée des parcelles qui y sont associées.::::የይዞታ መብት ማረጋገጫ ሰነድ ተያያዥነት ያላቸው ቁራሽ መሬቶች ጥቅል ስፋት ጋር ተመሳሳይ ስፋት አለው፤', NULL, '#{id}(ba_unit_id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('rrr-shares-total-check', 'RR050', 'sql', 'The sum of the shares (in ownership rights) must total to 1::::Сумма долей права собственности должна ровняться 1.::::مجموع الحصص في اصحاب الحقوق يجب ان يساوي واحد صحيح::::La somme des parts (du droit de propriété) doit être égale à 1.::::የባለሃብትነት መብት ድርሻዎች ጠቅላላ ድምር የግድ 1 መሆን አለበት', NULL, '#{id}(administrative.rrr.id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('ba_unit-spatial_unit-area-comparison', 'ba_unit-spatial_unit-area-comparison', 'sql', 'The difference between the property area (_$property_area) and the parcel area (_$parcel_area) must be less than 1%::::::::::::::::ንብረቱ ባረፈበት ቦታ ስፋትና (_ብርንብረት_ስፋት) የቁራሽ መሬት ስፋት (_ብር ቁራሽ መሬት_ስፋት) መካከል ያለው ልዩነት የግድ ከ1 % ማነስ አለበት', 'NOT USED BY SOLA STATE LAND', '#{id}(administrative.ba_unit.id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('rrr-must-have-parties', 'RR040', 'sql', 'The _$rrr_type interest on _$property_name must have a rightholder specified::::::::::::::::የ_ብርመገኃ_ዓይነት ጥቅም በ_ብር ንብረት_የባለመብት ስም መለየት የግድ ይላል', NULL, '');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('spatial-unit-group-not-overlap', 'spatial-unit-group-not-overlap', 'sql', 'Spatial unit groups of the same hierarchy must not overlap with each other. Tolerance of 0.5 m is applied.::::Пространственные группы одной и той же иерархии не должны пересекаться друг с другом. Погрешность не должна превышать 0.5 м::::::::::::አንድ ዓይነት ተዋረድ ያላቸው የቦታ አሃድ ስብስቦች እርስ በርሳቸው መደራረብ የለባቸውም', 'NOT USED BY SOLA STATE LAND', 'There is no parameter required.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('ba-unit-has-spatial-parcels', 'BA120', 'sql', 'Parcels on _$property_name have not been mapped; _$parcel_list::::::::::::::::ቁራሽ መሬቶች ላይ_ብርንብረት_ስም ካርታ ተነስቶ መሆን አለበት፤ _ብርቁራሽ መሬት_ዝርዝር', 'State Land BR-7', 'Parameters: #{id} (administrative.ba_unit.id)');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('cadastre-object-check-name', 'CA250', 'sql', 'Parcel name(s) inconsistent with naming convention; _$parcel_list ::::::::::::::::ከተለመደው ስም አሰጣጥ የሚጣረሱ የቁራሽ መሬት ስም ወይም ስሞች፤ _ብር ቁራሽ መሬት_ዝርዝር', 'Updated for State Land BR-5', '#{id}(cadastre.cadastre_object.id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('ba-unit-has-notes-to-action', 'BA110', 'sql', 'Notes on _$property_name require action; _$notes_list::::::::::::::::ማስታወሻዎች በ_ብርንብረት_ስም ተግባር ይሻል፤ _ብርማስታወሻዎች_ዝርዝር', 'State Land BR-6', 'Parameters: #{id} (administrative.ba_unit.id)');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('new-cadastre-objects-present', 'new-cadastre-objects-present', 'sql', 'New cadastral objects must be defined::::Новые кадастровые объекты должны быть определены.::::يجب تحديد كائن مساحة جديد::::Les nouveaux objets cadastres doivent être définis.::::አዲስ የካዳስተር ኦብጀክቶች ትርጓሜ ያስፈልጋቸዋል', 'NOT USED BY SOLA STATE LAND', '#{id}(transaction_id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('property-compenstation-comparison', 'VA010', 'sql', 'Final compenstation is more than %10 above the initial offer; _$property_list::::::::::::::::የመጨረሻ ካሳ መጀመሪያ ከቀረበው ከ10 % በላይ ነው፤ _ብርንብረት_ዝርዝር', 'State Land BR-9', 'Parameters: #{id} (application.service.id)');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('application-for-new-title-has-cancel-property-service', 'application-for-new-title-has-cancel-property-service', 'sql', 'When a new title is created there must be a cancel title service in the application for the parent title.::::Когда создается новый объект недвижимости, должна присутствовать услуга ликвидации недвижимости в заявлении родительской недвижимости.::::عند خلق سند ملكية جديد يجب ان يحتوي الطلب على خدمة  الغاء سند الملكية الاب::::Quand un nouveau titre est créé, un service de demande d''annulation de titre pour la propriété parent doit apparaître dans la demande.:::: የይዞታ መብት ሲቋቋም በዋና ይዞታ መብት ማመልከቻ ውስጥ የይዞታ መብት ሰርዝ አገልግሎት መኖር ይግድ ይላል', 'NOT USED BY SOLA STATE LAND', '');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('ba_unit-has-compatible-cadastre-object', 'ba_unit-has-compatible-cadastre-object', 'sql', 'Title should have compatible parcel (or cadastre object) description (appellation)::::Недвижимость должна иметь совместимый тип земельного участка.::::سند الملكية يجب ان يحتوي على وصف\ اسم   قطعة متوافقة::::Le titre doit avoir un descriptif (appellation) de parcelle (ou objet cadastre) compatible.::::የይዞታ መብት ማረጋገጫ ሰነድ የተጣጣመ የቁራሽ መሬት (ወይም ካዳስተር ኦብጀክት) ገለጻ (ስያሜ) ሊይዝ ይገባል፤', 'NOT USED BY SOLA STATE LAND', '#{id}(administrative.ba_unit.id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('target-parcels-check-nopending', 'target-parcels-check-nopending', 'sql', 'There should be no pending changes for any of target parcels::::Целевые участки не должны иметь каких-либо незавершенных изменений.::::يجب ان لا يوجد اية تغييرات معلقة على القطعة المستهدفة::::Il ne doit pas y avoir de changement en attente pour aucune des parcelles cibles.::::በሚመለከታቸው ቁራሽ መሬቶች ምንም በእንጥልጥል ላይ ያለ ለውጥ መኖር የለበትም', 'NOT USED BY SOLA STATE LAND', '#{id}(cadastre.cadastre_object.id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('application-br5-check-there-are-front-desk-services', 'application-br5-check-there-are-front-desk-services', 'sql', 'There are services in this application that should  be dealt in the front office. These services are of type: serviceEnquiry, documentCopy, cadastrePrint, surveyPlanCopy, titleSearch.::::В заявлении имеются услуги, которые должны предоставляться в отделе приема документов. У ним относятся: serviceEnquiry, documentCopy, cadastrePrint, surveyPlanCopy, titleSearch.::::بعض الخدمات المطلوبة في الطلب يجب التعامل معها من المكتب الامامي . هذه الخدمات : الاستفسار , تصوير وثيقة , طباعة مساحة ,  خطة المساحة , البحث عن سند ملكية::::Certains services de cette demande doivent être traitées par la réception. Ces services de type: service enquête, copie de document, impression cadastre, copie de plan de levé, recherche de titre.::::በዚህ ማመልከቻ ውስጥ የመስሪያ ቤቱ አመራር ውሳኔ የሚሹ አገልግሎቶች አሉ፤ እነዚህም አገልግሎቶች የመረጃ አገልግሎት፤ የሰነድ ቅጂ፤ የካዳስተር ፕሪንት፤ የቅየሳ ፕላን ቅጂ፤ የይዞታ መብት መረጋገጫ ሰነድ ፍለጋ ናቸው', 'NOT USED BY SOLA STATE LAND', 'Checks the services in the applications to see if they are amongst services considered as front office services');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('newtitle-br24-check-rrr-accounted', 'newtitle-br24-check-rrr-accounted', 'sql', 'All rights and restrictions from existing title(s) must be accounted for in the new titles created in this application.::::Все права и ограничения существующих объектов недвижимости должны быть учтены в новых объектах недвижимости, создаваемых в этом заявлении.::::جميع الحقوق او القيود من السندات الحالية يجب مراعاتها في  السندات الجديدة::::Tous les droits et restrictions du/des titre(s) existant(s) doivent être pris en compte dans les titres créés dans la demande.::::የቀደሙት መብቶች እና ገደቦች በዚህ ማመልከቻ በተቋቋሙት አዲስ መብቶች ይተካሉ', 'NOT USED BY SOLA STATE LAND', '#{id}(application_id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('cancel-title-check-rrr-cancelled', 'BA140', 'sql', 'All current interests on the property being disposed must be extinguished by this job::::::::::::::::በዚህ ስራ በንብረቱ ላይ የተቋቋሙ እየተላለፉ ያሉ ሁሉንም ጥቅሞች የግድ ቀሪ መደረግ አለባችው', NULL, '#{id}(application_id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('parcel-name-duplicated', 'CA260', 'sql', '_$rule_count duplicated parcel name(s); _$parcel_list::::::::::::::::_$rule_count duplicated parcel name(s); _$parcel_list', 'State Land BR-5', 'Parameters: #{id} (transaction.transaction.id)');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('rrr-has-conditions', 'RR150', 'sql', '_$rrr_type on _$property_name should have conditions recorded::::::::::::::::_$rrr_type on _$property_name should have conditions recorded', 'State Land BR-19', 'Parameters: #{id} (administrative.ba_unit.id)');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('ba_unit-has-a-valid-primary-right', 'BA070', 'sql', '_$property_name must have one State Landholder interest or one Owner interest.::::::::::::::::_$property_name must have one State Landholder interest or one Owner interest.', 'Updated for State Land BR-1', '#{id}(baunit_id) is requested.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('ba-unit-has-land-use', 'BA130', 'sql', '_$property_name must be linked to parcels that specify land use::::::::::::::::_$property_name must be linked to parcels that specify land use', 'State Land BR-11', 'Parameters: #{id} (administrative.ba_unit.id)');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('consolidation-db-structure-the-same', 'bfe8e722-99dd-11e3-8b71-a36603d16f1c', 'sql', 'The structure of the tables in the source and target database are the same.::::::::::::::::መነሻና መድረሻ ዳታቤዝ ውስጥ ያሉት ሰንጠረዦች ቅርጽ (መዋቅር) ተመሳሳይ ነው', NULL, 'It controls if every source table in consolidation schema is the same as the corresponding target table.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('application-on-approve-check-public-display', 'application-on-approve-check-public-display', 'sql', 'The publication period must be completed.::::Период публикации должен быть завершен.::::يجب استكمال فترة النشر::::La période de publication doit être exécutée.::::የሕትመቱ ጊዜ መጠናቀቅ የግድ ይላል', 'NOT USED BY SOLA STATE LAND', 'Checks the completion of the public display period for all instances of systematic registration service related to the application');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('area-check-percentage-newareas-oldareas', 'area-check-percentage-newareas-oldareas', 'sql', 'The difference between the total of the new parcels official areas and the total of the old parcels official areas should not be greater than 0.1%::::Разница между общей официальной площадью новых участков и площадью старых участков не должна превышать 0.1%.::::الفرق بين مجموع مساحات  القطع الجديدة الرسمية  ومجموع المساحات السابقة للقطع القديمة يجب ان لا يتجاوز 0.1 %::::La différence entre la superficie totale officielle des nouvelles parcelles et la superficie totale officielle des anciennes parcelles ne doit pas être supérieur à 0.1%.::::በአጠቃላይ ኦፊሴላዊ አዲስ ቁራሽ መሬቶች ስፋትና በአጠቃላይ ኦፊሴላዊ ነባር ቁራሽ መሬቶች ስፋት መካከል ያለው ልዩነት ከ0.1 % መብለጥ የለበትም', 'NOT USED BY SOLA STATE LAND', '');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('area-check-percentage-newofficialarea-calculatednewarea', 'CA140', 'sql', 'The difference between the official parcel area and its calculated area should be less than 1%; _$parcel_list::::::::::::::::በኦፊሴላዊ ቁራሽ መሬት ስፋት እና በተሰላው ስፋት መካከል ያለው ልዩነት ከ1 %  ማነሰ አለበት፤ ይኸውም _ብር ቁራሽ መሬት_ዝርዝር ', 'Updated for State Land BR-3', '#{id}(cadastre.cadastre_object.id) is requested. 
 Check new official area - calculated new area / new official area in percentage (Give in WARNING description, percentage & parcel if percentage > 1%)');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('service-on-complete-without-transaction', 'service-on-complete-without-transaction', 'sql', 'Service ''req_type'' must have been started and some changes made in the system::::Услуга ''req_type''  должна быть запущена и сделаны какие-либо изменения.::::يجب ان تكون  اخدمة ''req_type'' قد بدأت وهناك تغييرات غلى النظام::::Le service ''req_type'' doit avoir commencé et des changements faits dans le système.::::‹አርኢኪው_ዓይነት› አገልግሎት ተጀምሮ መሆን አለበት እናም በሥርዓቱ የተወሰኑ ለውጦች ተደርገውም መሆን አለበት', 'NOT USED BY SOLA STATE LAND', '');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('target-ba_unit-check-if-pending', 'target-ba_unit-check-if-pending', 'sql', 'Pending registration actions (from other applications) affecting the title to be cancelled should be cancelled::::Все незавершенные действия из других заявлений по регистрации прав с данной недвижимостью, которая будет ликвидирована должны быть отменены.::::حركات التسجيل المعلقة والتي تؤثر على سند الملكية من الطلبات الاخرى يجب الغاؤها::::Les actions d''enregistrement en attente (provenant d''autres demandes) affectant le titre à annuler doivent être annulées.::::የሚሰረዝ የይዞታ መብት ማረጋገጫ የሚነኩ በእንጥልጥል ላይ ያሉ ምዝገባ ድርጊቶች (ከሌሎች ማመልከቻዎች) መሰረዝ አለባቸው', 'NOT USED BY SOLA STATE LAND', '#{id}(baunit_id) is requested. It checks if there is no pending transaction for target ba_unit (a ba_unit flagged for cancellation).
 It checks if the administrative.ba_unit_target table has a record of this ba_unit which is different
 from the transaction that has flagged the ba_unit for cancellation, that this transaction record is not yet approved,
 that this ba_unit has an associated rrr record which is pending and that there are no other applications with intended or pending changes to this ba_unit.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('new-cadastre-objects-do-not-overlap', 'CA150', 'sql', 'New parcel polygons must not overlap::::::::::::::::አዲስ የቁራሽ መሬት ፖሊጎኖች  መደራረብ የለባቸውም', 'Updated for State Land BR-4', '#{id}(transaction_id) is requested. Check the union of new co has the same area as the sum of all areas of new co-s, which means the new co-s don''t overlap');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('service-has-person-verification', 'service-has-person-verification', 'sql', 'Within the application for the service a personal identification verification should be attached.::::В заявлении должен присутствовать документ удостоверяющий личность.::::ضمن الطلب ولاجل الخدمة يجب  ارفاق وثيقة تعريف بالشخصية::::Pour la demande d''un service, la vérification de l''identification personnelle doit être attachée.::::ከአገልግሎት መጠየቂያ ማመልከቻ ጋር የግለሰቡን የማንነት ማረጋገጫ መታወቂያ መያያዝ አለበት', 'NOT USED BY SOLA STATE LAND', '#{id}(application.service.id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('application-on-approve-check-services-without-transaction', 'application-on-approve-check-services-without-transaction', 'sql', 'Within an application,all services making changes to core records must be completed and have utilised an instance of transaction before application can be approved.::::Все услуги в заявлении, которые внесли изменения в основные данные, должны быть завершены перед тем как заявление может быть одобрено.::::تاكد من  ان جميع الخدمات التي تؤدي الى تغييرات على السجلات الاساسية  لها  حالة مكتملة::::Lors d''une demande, tous les services faisant des changements aux données clés doivent être exécutés et avoir utilisés une instance de transaction avant que la demande soit approuvée.::::ማመልከቻ ከመጽደቁ በፊት ዋና መዛግብት ላይ ለውጥ ለማድረግ የሚያስፈልጉትን አገልግሎቶች ተሞልተው ከማመልከቻው ጋር መያያዝ አለባቸው', 'NOT USED BY SOLA STATE LAND', 'Checks that all services have the status of completed and that there is a transaction record referring to each service record through the field from_service_id');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('application-baunit-has-parcels', 'application-baunit-has-parcels', 'sql', 'Title must have Parcels::::Недвижимость должна иметь участок::::سند الملكية يجب ان يحتوي على قطع::::Un titre doit contenir au moins un numéro de parcelle::::የይዞታ መብት ማረጋገጫ ሰነድ ቁራሽ መሬቶችን የያዘ መሆን አለበት፤', 'NOT USED BY SOLA STATE LAND', '#{id}(application.service.id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('application-on-approve-check-systematic-reg-no-objection', 'application-on-approve-check-systematic-reg-no-objection', 'sql', 'There must be no objection against the systematic registration::::Не должно быть каких-либо обжалований по системной регистрации.::::يجب ان لا يوجد اعتراض على التسجيل المنتظم::::Il ne doit pas y avoir d''objection à l''enregistrement systématique.::::አጠቃላይ ምዝገባውን የሚመለከት ተቃውሞ ሊኖር አይገባም', 'NOT USED BY SOLA STATE LAND', 'Checks the absence of objections for systematic registration service related to the application');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('service-check-no-previous-digital-title-service', 'service-check-no-previous-digital-title-service', 'sql', 'For the Convert Title service there must be no existing digital title record (including the recording of a primary (ownership) right) for the identified title::::Для услуги конвертации недвижимости не должно быть существующих записей этой недвижим.::::في خدمة تحويل الى سند  ملكية رقمي يجب ان لا يوجد  سجل رقمي للملكية بما فيه  تسجيل الحق الاساسي::::Pour le service de conversion de titre, il ne doit pas y avoir de titre numérique existant déjà enregistré (incluant l''enregistrement d''un droit principal (propriété) pour le titre identifié.::::የይዞታ መብት ማረጋገጫ ሰነድ ለውጥ አገልግሎት በአሁኑ ጊዜ የዲጂታል የይዞታ መብት ማርጋገጫ ሰነድ ሪኮርድ መኖር የለበትም (ለተለየው የይዞታ መብት ማርጋገጫ ሰነድ ዋና ባለሀብትነት መብት ሪኮርድንግን ጨምሮ)', 'NOT USED BY SOLA STATE LAND', '#{id}(application.service.id) is requested where service is for newDigitalTitle or newDigitalProperty');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('source-attach-in-transaction-allowed-type', 'source-attach-in-transaction-allowed-type', 'sql', 'Document to be registered must have an allowable and current source type::::Документы для регистрации должны иметь допустимый тип.::::الوثيقة المراد تسجيلها يجب ان يكون لها نوع مصدر حالي مسموح به::::Le document à enregistrer doit avoir un type de source courant et disponible.::::የሚመዘገብ ሰነድ የሚፈቅድ እና ወቀታዊ ምንጭ አይነት ሊኖረው የግድ ይላል', 'NOT USED BY SOLA STATE LAND', '#{id}(source.source.id) is requested. It checks if the source has a type which has the is_for_registration attribute true.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('app-allowable-primary-right-for-new-title', 'app-allowable-primary-right-for-new-title', 'sql', 'An allowable primary right (ownership, apartment, State ownership, lease) must be identified for a new title::::Одно из допустимых прав собственности такое как - право собственности, право собственности на квартиру, государственное право собственности, аренда, должно быть зарегистрировано для нового объекта недвижимости.::::الحق الاساسي المسموح به  (المالك, الشقة, مالك العقار, الايجار ) يجب تحديده لسند ملكية جديد::::Tous les droits principaux autorisés (propriété, appartement, propriété de l''Etat, bail) doivent être identifiés pour le nouveau titre::::አንድ የሚፍቅድ ዋና መብት (ባለሀብትነት አፓርታማ፤ የመንግስት በለሀብትነት፤ ሊዝ) የግድ ለአዲስ የይዞታ መብት ማረጋገጫ መለየት አለበት ', 'NOT USED BY SOLA STATE LAND', '#{id}(application.application.id) is requested');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('rrr-has-pending', 'rrr-has-pending', 'sql', 'There are no other pending actions on the rights and restrictions being changed or removed on this application::::Нет никаких изменений в правах и ограничениях, сделанных из текущего заявления::::لا يوجد حركات بحاجة لتنفيذ على الحقوق او القيود لهذا الطلب::::Il n''y a pas d''autre actions en attente sur les droits et restrictions en cours de changement ou supprimé de cette application.::::በዚህ ማመልከቻ በመለወጥ ወይም በመወገድ ላይ ባሉት መብቶች ወይም ገደቦች ሌላ ምንም በእንጥልጥል ያሉ ተግባሮች የሉም', 'NOT USED BY SOLA STATE LAND', '#{id}(administrative.rrr.id) is requested. It checks if for the target rrr there is already a pending edit or record.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('cadastre-redefinition-union-old-new-the-same', 'cadastre-redefinition-union-old-new-the-same', 'sql', 'The union of the new polygons must be the same as the union of the old polygons::::Объединение новых полигонов должно быть таким же как объединение старых полигонов.::::الاتحاد من المضلعات الجديدة يجب أن تكون نفس الاتحاد من المضلعات القديمة::::L''union des nouveaux polygones doit être le même que l''union des anciens polygones.::::የአዲሶቹ ፖሊጎኖች ውህደት የግድ ከአሮጌዎቹ ፖሊጎኖች ውህደት ጋር ተመሳሳይ መሆን አለበት', 'NOT USED BY SOLA STATE LAND', '#{id} is the parameter asked. It is the transaction id.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('app-other-app-with-caveat', 'app-other-app-with-caveat', 'sql', 'The identified property is affected by another live application that includes a service to register a caveat. An application with a cancel or waiver/vary caveat service must be registered before this application can proceed.::::Выбранная недвижимость используется в другом заявлении, находящемся в обработке и включающее регистрацию ареста. Заявление с услугой отмены ареста должно быть зарегистрировано для того чтобы продолжить с текущим заявлением.::::هناك طلب أخر على الملكية المحددة والذي يحتوي  خدمة فيها قيود على نفس الملكية. يجب التنازل او الغاء القيود قبل امكانية الاستمرار::::La propriété identifiée est affectée par une autre demande en cours qui inclue un service d''enregistrement de caveat. Une demande de service d''annulation ou de variation/résiliation du caveat doit être enregistrée avant de pouvoir procéder à cette demande.::::ተለይቶ የታወቀው ንብረት በሌላ በመታየት ባለና የሁኔታ ምዝገባን በሚያካትት  ማመልከቻ ይነካል፤ ይህ ማመልከቻ መታየት ከመቀጠሉ በፊት የሁኔታ መሰረዝ ወይም የመብት መተው/የእክል ማስጠንቀቂያ ማሻሻል አገልግሎት የተመለከተ ማመልከቻ  የግድ መመዝገብ ይኖርበታል', 'NOT USED BY SOLA STATE LAND', '#{id}(application.application.id) is requested.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('app-current-caveat-and-no-remove-or-vary', 'app-current-caveat-and-no-remove-or-vary', 'sql', 'The identified property has a current or pending caveat registered on the title. The application must include a cancel or waiver/vary caveat service for registration to proceed.::::Выбранная недвижимость имеет арест. Заявление должно включать услугу снятия ареста для того чтобы продолжить регистрацию.::::الملكية المحددة عليها قيود . يجب الغاء القيود او التنازل عنها قبل امكانية الاستمرار::::Une caveat en cours ou en attente est enregistré sur le titre de la propriété identifiée. Il est nécessaire de procéder à un service d''annulation ou de renonciation/variation du caveat avant de procéder à l''enregistrement de la demande.::::ተለይቶ የታወቀው ንብረት የይዞታ መብት ማረጋገጫ ሰነድ ላይ የጸና ወይም በእንጥልጥል ላይ ያለ የሁኔታ ምዝገባው አገልግሎት ተመዝግቦበታል፤ ምዝገባው መከናወን ከመቀጠሉ በፊት ማመልከቻው የይሰረዝ ወይም መብት መተው/የእክል ማስጠንቀቂያ ማሻሻል አገልግሎት የግድ መካተት ይኖርበታል', 'NOT USED BY SOLA STATE LAND', '#{id}(application.application.id) is requested. It checks if there is a caveat (pending or current) registered
 on the title and if the application does not have any service of type remove or vary caveat');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('spatial-unit-group-inside-other-spatial-unit-group', 'spatial-unit-group-inside-other-spatial-unit-group', 'sql', 'Spatial unit groups that are not of the top hierarchy must be spatially inside another spatial unit group with hierarchy which is a level up. Tolerance of 0.5 m is applied.::::Пространственные группы, которые не находятся на самой вершине иерархии, должны быть расположены внутри других пространственных групп с более высшим уровнем иерархии. Погрешность может составлять 0.5 м.::::::::::::አንድ ዓይነት ተዋረድ የሌላቸው የቦታ አሃድ ስብስቦች ከሌላ በተዋረድ ከፍ ካለ የቦታ ስብስብ ስር የግድ መሆን አለባቸው 0.5 ሜ. ልዩነት መታገስ ይቻላል፡፡ ', 'NOT USED BY SOLA STATE LAND', 'There is no parameter required.');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('power-of-attorney-service-has-document', 'power-of-attorney-service-has-document', 'sql', 'Service ''req_type'' must have must have one associated Power of Attorney document::::Услуга ''req_type''  должна иметь одну доверенность.::::خدمة ''req_type'' يجب ان ترتبط بوكالة::::Le service ''req_type'' doit avoir un document de procuration associé.::::‹አርኢኪው_ዓይነት› አገልግሎት፤ አንድ ተዛማጅ የውክልና ሥልጣን የሚገልጽ ሰነድ ሊኖረው ግድ ይገባል', 'NOT USED BY SOLA STATE LAND', '#{id}(application.service.id)');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('newtitle-br22-check-different-owners', 'newtitle-br22-check-different-owners', 'sql', 'Owners of new titles should be the same as owners of underlying titles::::Владельцы новых объектов недвижимости должны быть такие же как в родительских объектах.::::المالكون في سند الملكية الجديد يجب ان يكونوا نفس المالكين من السندات السابقة::::Les propriétaires des nouveaux titres doivent être les mêmes que les propriétaires des titres sous-jacents.::::የአዲስ የይዞታ መብት ባለሀብቶች ከሥረ-መሠረት ባለሀብቶች አንድ መሆን አለባቸው', 'NOT USED BY SOLA STATE LAND', '#{id}(baunit_id) is requested.
Check that new title owners are the same as underlying titles owners (Give WARNING if > 0)');
INSERT INTO br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('application-cancel-property-service-before-new-title', 'application-cancel-property-service-before-new-title', 'sql', 'New Freehold title service must come before Cancel Title service in the application.::::Услуга нового права собственности (свободное) должна быть перед услугой отмены права собственности.
system.br.application-approve-cancel-old-titles.feedback Заявление с услугой нового права собственности (свободное) должно также включать услугу ликвидации родительского права собственности.::::خدمة تسجيل ملكية حرة يجب ان تسبق خدمة الغاء ملكية في الطلب::::Un service de nouveau titre de propriété franche doit venir avant le service d''annulation du titre dans la demande.::::New Freehold titel service must come before Cancel Title service in the application', 'NOT USED BY SOLA STATE LAND', '');


ALTER TABLE br ENABLE TRIGGER ALL;

--
-- Data for Name: br_definition; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE br_definition DISABLE TRIGGER ALL;

INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('generate-notation-reference-nr', '2014-02-20', 'infinity', 'SELECT coalesce(system.get_setting(''system-id''), '''') || to_char(now(), ''yymmdd'') || ''-'' || trim(to_char(nextval(''administrative.rrr_nr_seq''), ''0000'')) AS vl');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('generate-rrr-nr', '2014-02-20', 'infinity', 'SELECT coalesce(system.get_setting(''system-id''), '''') || to_char(now(), ''yymmdd'') || ''-'' || trim(to_char(nextval(''administrative.rrr_nr_seq''), ''0000'')) AS vl');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('generate-source-nr', '2014-02-20', 'infinity', 'SELECT coalesce(system.get_setting(''system-id''), '''') || to_char(now(), ''yymmdd'') || ''-'' || trim(to_char(nextval(''source.source_la_nr_seq''), ''000000000'')) AS vl');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('generate-cadastre-object-lastpart', '2014-02-20', 'infinity', 'SELECT cadastre.get_new_cadastre_object_identifier_last_part(#{geom}, #{cadastre_object_type}) AS vl');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('generate-cadastre-object-firstpart', '2014-02-20', 'infinity', 'SELECT cadastre.get_new_cadastre_object_identifier_first_part(#{last_part}, #{cadastre_object_type}) AS vl');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('generate-spatial-unit-group-name', '2014-02-20', 'infinity', 'SELECT cadastre.generate_spatial_unit_group_name(get_geometry_with_srid(#{geom_v}), #{hierarchy_level_v}, #{label_v}) AS vl');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('generate-application-nr', '2014-02-20', 'infinity', 'SELECT coalesce(system.get_setting(''system-id''), '''') || to_char(now(), ''yymm'') || trim(to_char(nextval(''application.application_nr_seq''), ''0000'')) AS vl');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('application-on-approve-check-public-display', '2014-02-20', 'infinity', '  SELECT (COUNT(*) = 0)  AS vl
   FROM cadastre.land_use_type lu, cadastre.cadastre_object co, cadastre.spatial_value_area sa, administrative.ba_unit_contains_spatial_unit su, 
   application.application_property ap, application.application aa, application.service s, source.source ss
  WHERE sa.spatial_unit_id::text = co.id::text AND sa.type_code::text = ''officialArea''::text AND su.spatial_unit_id::text = sa.spatial_unit_id::text 
  AND ap.ba_unit_id::text = su.ba_unit_id::text AND aa.id::text = ap.application_id::text AND s.application_id::text = aa.id::text 
  AND s.request_type_code::text = ''systematicRegn''::text AND s.status_code::text = ''completed''::text
   AND COALESCE(co.land_use_code, ''residential''::character varying)::text = lu.code::text
  and ss.reference_nr = co.name_lastpart
  and ss.reference_nr = co.name_lastpart and ss.expiration_date >= now() 
  and s.application_id = #{id};');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('app-check-title-ref', '2014-02-20', 'infinity', 'WITH 	convertTitleApp	AS	(SELECT se.id FROM application.service se
				WHERE se.application_id = #{id}
				AND se.request_type_code = ''newDigitalTitle''),
	titleRefChk	AS	(SELECT aprp.application_id FROM application.application_property aprp
				WHERE aprp.application_id= #{id} 
				AND SUBSTR(aprp.name_firstpart, 1) != ''N''
				AND NOT(aprp.name_lastpart ~ ''^[0-9]+$''))--isnumeric test
	
SELECT CASE 	WHEN (SELECT (COUNT(*) = 0) FROM convertTitleApp) THEN NULL
		WHEN (SELECT (COUNT(*) = 0) FROM titleRefChk) THEN TRUE
		ELSE FALSE
	END AS vl');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('app-allowable-primary-right-for-new-title', '2014-02-20', 'infinity', 'WITH 	newTitleApp	AS	(SELECT (SUM(1) > 0) AS fhCheck FROM application.service se
				WHERE se.application_id = #{id}
				AND se.request_type_code IN (''newFreehold'', ''newApartment'', ''newState'')),
	existTitleApp	AS	(SELECT (SUM(1) > 0) AS fhCheck FROM application.application_property prp1
					INNER JOIN application.service sv ON (prp1.application_id = sv.application_id)
				WHERE prp1.application_id = #{id}
				AND sv.request_type_code = ''newDigitalTitle'')
				
 SELECT CASE WHEN (SELECT ((SELECT * FROM newTitleApp) OR (SELECT * FROM existTitleApp)) IS NULL) THEN NULL 
	WHEN ((SELECT COUNT(*) FROM existTitleApp) = 0) THEN	(SELECT (COUNT(*) = 0) FROM application.application_property prp2
									INNER JOIN administrative.rrr rr2 
										ON ((prp2.ba_unit_id = rr2.ba_unit_id) AND NOT(rr2.is_primary OR (rr2.type_code IN (''ownership'', ''apartment'', ''stateOwnership'', ''lease''))))
								 WHERE prp2.application_id = #{id} )
	ELSE	(SELECT (COUNT(*) = 0) FROM application.service sv2 
			 INNER JOIN transaction.transaction tn2 ON (sv2.id = tn2.from_service_id) 
			 INNER JOIN administrative.ba_unit ba2 ON (tn2.id = ba2.transaction_id) 
			 INNER JOIN administrative.rrr rr3 
				ON ((ba2.id = rr3.ba_unit_id) AND NOT(rr3.is_primary OR (rr3.type_code IN (''ownership'', ''apartment'', ''stateOwnership'', ''lease''))))
			 WHERE sv2.application_id = #{id} )
	END AS vl');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('app-other-app-with-caveat', '2014-02-20', 'infinity', 'SELECT (SELECT COUNT(*) > 0 FROM application.service sv WHERE sv.application_id = ap.application_id AND sv.request_type_code IN (''varyCaveat'', ''removeCaveat'')) AS vl
FROM application.application_property ap
	INNER JOIN application.application_property ap2 ON (((ap.name_firstpart, ap.name_lastpart) = (ap2.name_firstpart, ap2.name_lastpart)) AND (ap.id != ap2.id))
	INNER JOIN application.application app2 ON (ap2.application_id = app2.id)
	INNER JOIN application.service sv2 ON ((app2.id = sv2.application_id) AND (sv2.request_type_code = ''caveat'') AND (sv2.status_code != ''cancelled'') AND (app2.status_code NOT IN (''completed'', ''annulled'')))
WHERE ap.application_id = #{id} 
ORDER BY 1
LIMIT 1');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('application-cancel-property-service-before-new-title', '2014-02-20', 'infinity', '
WITH 	newFreeholdApp	AS	(SELECT (SUM(1) > 0) AS fhCheck FROM application.service se
				WHERE se.application_id = #{id}
				AND se.request_type_code = ''newFreehold''),
 	orderCancel	AS	(SELECT service_order + 1 AS cancelSequence FROM application.service sv 
				WHERE sv.application_id = #{id}
				AND sv.request_type_code = ''cancelProperty'' LIMIT 1),	
 	orderNew	AS	(SELECT service_order + 1 AS newSequence FROM application.service sv 
				WHERE sv.application_id = #{id}
				AND sv.request_type_code = ''newFreehold'' LIMIT 1)
				
SELECT CASE WHEN fhCheck IS TRUE THEN ((SELECT cancelSequence FROM orderCancel) - (SELECT newSequence FROM orderNew)) > 0
		ELSE NULL
	END AS vl FROM newFreeholdApp');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('app-title-has-primary-right', '2014-02-20', 'infinity', 'WITH 	newTitleApp	AS	(SELECT (SUM(1) > 0) AS fhCheck FROM application.service se
				WHERE se.application_id = #{id}
				AND se.request_type_code IN (''newFreehold'', ''newApartment'', ''newState'')),
	start_titles	AS	(SELECT DISTINCT ON (pt.from_ba_unit_id) pt.from_ba_unit_id, s.application_id FROM administrative.rrr rr 
				INNER JOIN administrative.required_relationship_baunit pt ON (rr.ba_unit_id = pt.to_ba_unit_id)
				INNER JOIN transaction.transaction tn ON (rr.transaction_id = tn.id)
				INNER JOIN application.service s ON (tn.from_service_id = s.id) 
				INNER JOIN application.application ap ON (s.application_id = ap.id)
				WHERE ap.id = #{id}),
	start_primary_rrr AS 	(SELECT DISTINCT ON(pp.nr) pp.nr FROM administrative.rrr pp 
				WHERE pp.status_code != ''cancelled''
				AND pp.is_primary
				AND pp.ba_unit_id IN (SELECT from_ba_unit_id  FROM start_titles))

SELECT CASE WHEN fhCheck IS TRUE THEN (SELECT sum(1) FROM start_primary_rrr) = 1
		ELSE NULL
	END AS vl FROM newTitleApp');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('application-br2-check-title-documents-not-old', '2014-02-20', 'infinity', 'SELECT s.recordation + 1 * interval ''1 week'' > NOW() AS vl
FROM application.application_uses_source a_s 
	INNER JOIN source.source s ON (a_s.source_id= s.id)
WHERE a_s.application_id = #{id}
AND s.type_code = ''title''');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('application-br5-check-there-are-front-desk-services', '2014-02-20', 'infinity', 'SELECT CASE WHEN (COUNT(*)= 0) THEN NULL
	ELSE FALSE 
	end AS vl
FROM application.service
WHERE application_id = #{id} 
AND action_code != ''cancel''
AND request_type_code IN (''serviceEnquiry'', ''documentCopy'', ''cadastrePrint'', ''surveyPlanCopy'', ''titleSearch'')');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('applicant-name-to-owner-name-check', '2014-02-20', 'infinity', 'WITH apStr AS (SELECT  COALESCE(name, '''') || '' '' || COALESCE(last_name, '''') AS searchStr FROM party.party pty
		INNER JOIN application.application ap ON (ap.contact_person_id = pty.id)
		WHERE ap.id = #{id}),
     apStr2 AS (SELECT  COALESCE(last_name, '''') AS searchStr FROM party.party pty
		INNER JOIN application.application ap ON (ap.contact_person_id = pty.id)
		WHERE ap.id = #{id}),
    poaQuery AS (SELECT pty.name AS firstName, pty.last_name AS lastName FROM application.application_property ap
			INNER JOIN administrative.ba_unit ba ON ((ap.name_firstpart, ap.name_lastpart) = (ba.name_firstpart, ba.name_lastpart))
			INNER JOIN administrative.rrr rr ON ((ba.id = rr.ba_unit_id) AND (rr.status_code = ''current'') AND rr.is_primary)
			INNER JOIN administrative.rrr_share rs ON (rr.id = rs.rrr_id)
			INNER JOIN administrative.party_for_rrr pr ON (rs.rrr_id = pr.rrr_id)
			INNER JOIN party.party pty ON (pr.party_id = pty.id)
		WHERE ap.application_id = #{id})

SELECT CASE WHEN (COUNT(*) > 0) THEN TRUE
		ELSE NULL
	END AS vl FROM poaQuery
WHERE (compare_strings((SELECT searchStr FROM apStr), COALESCE(firstName, '''') || '' '' || COALESCE(lastName, '''')) OR compare_strings((SELECT searchStr FROM apStr2), COALESCE(firstName, '''') || '' '' || COALESCE(lastName, '''')))
ORDER BY vl
LIMIT 1');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('application-br3-check-properties-are-not-historic', '2014-02-20', 'infinity', 'WITH baUnitRecs AS	(SELECT ba.status_code AS status FROM application.application_property ap
				INNER JOIN administrative.ba_unit ba ON ((ap.name_lastpart = ba.name_lastpart) AND (ap.name_firstpart = ba.name_firstpart))
			WHERE application_id= #{id})

SELECT	CASE 	WHEN (SELECT (COUNT(*) = 0) FROM baUnitRecs) THEN NULL
		WHEN (COUNT(*) = 0) THEN TRUE
		ELSE  FALSE
	END AS vl FROM baUnitRecs
WHERE status = ''historic''
ORDER BY 1
LIMIT 1 ');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('application-br6-check-new-title-service-is-needed', '2014-02-20', 'infinity', 'SELECT	CASE	WHEN (name_firstpart, name_lastpart) NOT IN (SELECT name_firstpart, name_lastpart FROM administrative.ba_unit)
			THEN (SELECT (COUNT(*) > 0) FROM application.service WHERE request_type_code = ''newFreehold'')
		ELSE TRUE
	END AS vl
FROM application.application_property  
WHERE application_id=#{id}
ORDER BY 1
LIMIT 1');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('application-on-approve-check-services-status', '2014-02-20', 'infinity', 'SELECT (COUNT(*) = 0)  AS vl FROM application.service sv 
WHERE sv.application_id = #{id} 
AND sv.status_code NOT IN (''completed'', ''cancelled'')');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('application-on-approve-check-services-without-transaction', '2014-02-20', 'infinity', 'SELECT (COUNT(*) = 0) AS vl FROM application.service sv 
	INNER JOIN transaction.transaction tn ON (sv.id = tn.from_service_id)
WHERE sv.application_id = #{id} 
AND sv.status_code NOT IN (''completed'', ''cancelled'')');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('application-on-approve-check-systematic-reg-no-objection', '2014-02-20', 'infinity', '  SELECT (COUNT(*) = 0)  AS vl
   FROM  application.application aa, 
   application.service s
  WHERE  s.application_id::text = aa.id::text 
  AND s.application_id::text in (select s.application_id 
                                 FROM application.service s
                                 where s.request_type_code::text = ''systematicRegn''::text
                                 and s.application_id = #{id}) 
  AND s.request_type_code::text = ''lodgeObjection''::text
  AND s.status_code::text != ''cancelled''::text
  and s.application_id = #{id};');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('application-br8-check-has-services', '2014-02-20', 'infinity', 'SELECT (COUNT(*) > 0) AS vl
FROM application.service sv 
WHERE sv.application_id = #{id}
AND sv.status_code != ''cancelled''');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('application-verifies-identification', '2014-02-20', 'infinity', 'SELECT (CASE 	WHEN app.id is  NULL THEN NULL
		ELSE COUNT(1) > 0
	 END) as vl
FROM application.application app
  LEFT JOIN application.application_uses_source aus ON (aus.application_id = app.id)
  LEFT JOIN source.source sc ON ((sc.id = aus.source_id) AND (sc.type_code = ''idVerification''))
WHERE app.id= #{id}
GROUP BY app.id
LIMIT 1');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('newtitle-br24-check-rrr-accounted', '2014-02-20', 'infinity', '
WITH 	pending_property_rrr AS (SELECT DISTINCT ON(rp.nr) rp.nr FROM administrative.rrr rp 
				INNER JOIN transaction.transaction tn ON (rp.transaction_id = tn.id)
				INNER JOIN application.service s ON (tn.from_service_id = s.id) 
				INNER JOIN application.application ap ON (s.application_id = ap.id)
				WHERE ap.id = #{id}
				AND rp.status_code = ''pending''),
								
	parent_titles	AS	(SELECT DISTINCT ON (ba.id) ba.id AS liveTitle, from_ba_unit_id FROM administrative.ba_unit ba
				INNER JOIN transaction.transaction tn ON (ba.transaction_id = tn.id)
				INNER JOIN application.service s ON (tn.from_service_id = s.id) 
				INNER JOIN administrative.required_relationship_baunit pt ON (ba.id = pt.to_ba_unit_id)
				WHERE s.application_id = #{id}),
				
	new_titles	AS	(SELECT DISTINCT ON (rr.ba_unit_id) rr.ba_unit_id FROM administrative.rrr rr 
				INNER JOIN administrative.ba_unit nt ON (rr.ba_unit_id = nt.id)
				INNER JOIN transaction.transaction tn ON (rr.transaction_id = tn.id)
				INNER JOIN application.service s ON (tn.from_service_id = s.id) 
				INNER JOIN application.application ap ON (s.application_id = ap.id)
				WHERE ap.id = #{id}),
	newFreeholdApp	AS	(SELECT (SUM(1) > 0) AS fhCheck FROM application.service se
				WHERE se.application_id = #{id}
				AND se.request_type_code = ''newFreehold''),
					
	prior_property_rrr AS 	(SELECT DISTINCT ON(pp.nr) pp.nr FROM administrative.rrr pp 
				WHERE pp.status_code = ''current''
				AND pp.ba_unit_id IN (SELECT from_ba_unit_id  FROM parent_titles)),

	rem_property_rrr AS	(SELECT nr FROM prior_property_rrr WHERE nr NOT IN (SELECT nr FROM pending_property_rrr))
				
SELECT CASE WHEN fhCheck IS TRUE THEN (SELECT COUNT(nr) FROM rem_property_rrr) = 0
		ELSE NULL
	END AS vl FROM newFreeholdApp');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('application-br1-check-required-sources-are-present', '2014-02-20', 'infinity', 'WITH reqForAp AS 	(SELECT DISTINCT ON(r_s.source_type_code) r_s.source_type_code AS typeCode
			FROM application.request_type_requires_source_type r_s 
				INNER JOIN application.service sv ON((r_s.request_type_code = sv.request_type_code) AND (sv.status_code != ''cancelled''))
			WHERE sv.application_id = #{id}),
     inclInAp AS	(SELECT DISTINCT ON (sc.id) sc.id FROM reqForAp req
				INNER JOIN source.source sc ON (req.typeCode = sc.type_code)
				INNER JOIN application.application_uses_source a_s ON ((sc.id = a_s.source_id) AND (a_s.application_id = #{id})))
SELECT 	CASE 	WHEN (SELECT (SUM(1) IS NULL) FROM reqForAp) THEN NULL
		WHEN ((SELECT COUNT(*) FROM inclInAp) - (SELECT COUNT(*) FROM reqForAp) >= 0) THEN TRUE
		ELSE FALSE
	END AS vl');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('application-approve-cancel-old-titles', '2014-02-20', 'infinity', '
WITH 	newFreeholdApp	AS	(SELECT (SUM(1) > 0) AS fhCheck FROM application.service se
				WHERE se.application_id = #{id}
				AND se.request_type_code = ''newFreehold''),
	parent_titles	AS	(SELECT DISTINCT ON (ba.id) ba.id AS liveTitle, ba.status_code FROM administrative.ba_unit ba
				INNER JOIN transaction.transaction tn ON (ba.transaction_id = tn.id)
				INNER JOIN application.service s ON (tn.from_service_id = s.id) 
				INNER JOIN administrative.required_relationship_baunit pt ON (ba.id = pt.to_ba_unit_id)
				WHERE s.application_id = #{id}
				AND ba.status_code = ''pending'')
				
SELECT CASE WHEN fhCheck IS TRUE THEN (SELECT COUNT(liveTitle) FROM parent_titles) > 0
		ELSE NULL
	END AS vl FROM newFreeholdApp
');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('application-for-new-title-has-cancel-property-service', '2014-02-20', 'infinity', '
WITH 	newFreeholdApp	AS	(SELECT (SUM(1) > 0) AS fhCheck FROM application.service se
				WHERE se.application_id = #{id}
				AND se.request_type_code = ''newFreehold'')
					
				
SELECT CASE WHEN fhCheck IS TRUE THEN (SELECT COUNT(id) FROM application.service sv 
					WHERE sv.application_id = #{id}
					AND sv.request_type_code = ''cancelProperty'') > 0
		ELSE NULL
	END AS vl FROM newFreeholdApp');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('app-current-caveat-and-no-remove-or-vary', '2014-02-20', 'infinity', 'SELECT (SELECT (COUNT(*) > 0) FROM application.service sv 
  WHERE ((sv.application_id = ap.application_id) AND (sv.request_type_code IN (''varyCaveat'', ''removeCaveat'')))) AS vl
FROM application.application_property ap 
  INNER JOIN administrative.ba_unit ba ON ((ap.name_firstpart, ap.name_lastpart) = (ba.name_firstpart, ba.name_lastpart))
  LEFT JOIN administrative.rrr ON (rrr.ba_unit_id = ba.id)
WHERE ((ap.application_id = #{id}) AND (rrr.type_code = ''caveat'') AND (rrr.status_code IN (''pending'', ''current'')))
ORDER BY 1 desc
LIMIT 1');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('application-not-transferred', '2014-02-20', 'infinity', 'select count(1) = 0 as vl 
from application.service 
where application_id = #{id} and request_type_code=''recordTransfer'' and status_code = ''completed''');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('application-spatial-unit-not-transferred', '2014-02-20', 'infinity', 'select count(1) = 0 as vl
from application.application_spatial_unit  
where application_id = #{id} and spatial_unit_id in (select spatial_unit_id from application.application_spatial_unit where application_id in (select application_id from application.service where request_type_code=''recordTransfer'' and status_code = ''completed''))');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('documents-present', '2014-02-20', 'infinity', 'WITH cadastreDocs AS 	(SELECT DISTINCT ON (id) ss.id, ext_archive_id FROM source.source ss
				INNER JOIN transaction.transaction_source ts ON (ss.id = ts.source_id)
				INNER JOIN transaction.transaction tn ON(ts.transaction_id = tn.id)
				WHERE tn.from_service_id = #{id}
				ORDER BY 1),
	rrrDocs AS	(SELECT DISTINCT ON (id) ss.id, ext_archive_id FROM source.source ss
				INNER JOIN administrative.source_describes_rrr sr ON (ss.id = sr.source_id)
				INNER JOIN administrative.rrr rr ON (sr.rrr_id = rr.id)
				INNER JOIN transaction.transaction tn ON(rr.transaction_id = tn.id)
				WHERE tn.from_service_id = #{id}
				ORDER BY 1),
     titleDocs AS	(SELECT DISTINCT ON (id) ss.id, ext_archive_id FROM source.source ss
				INNER JOIN administrative.source_describes_ba_unit su ON (ss.id = su.source_id)
				WHERE su.ba_unit_id IN (SELECT  ba_unit_id FROM rrrDocs)
				ORDER BY 1),
     regDocs AS		(SELECT DISTINCT ON (id) ss.id, ext_archive_id FROM source.source ss
				INNER JOIN transaction.transaction tn ON (ss.transaction_id = tn.id)
				INNER JOIN application.service sv ON (tn.from_service_id = sv.id)
				WHERE sv.id = #{id}
				AND sv.request_type_code IN (''regnPowerOfAttorney'', ''regnStandardDocument'', ''cnclPowerOfAttorney'', ''cnclStandardDocument'')
				ORDER BY 1),
     serviceDocs AS	((SELECT * FROM rrrDocs) UNION (SELECT * FROM cadastreDocs) UNION (SELECT * FROM titleDocs) UNION (SELECT * FROM regDocs))
     
     
 SELECT (((SELECT COUNT(*) FROM serviceDocs) - (SELECT COUNT(*) FROM serviceDocs WHERE ext_archive_id IS NOT NULL)) = 0) AS vl');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('application-baunit-has-parcels', '2014-02-20', 'infinity', 'select (select count(*)>0 from administrative.ba_unit_contains_spatial_unit ba_su 
		inner join cadastre.cadastre_object co on ba_su.spatial_unit_id= co.id
	where co.status_code in (''current'') and co.geom_polygon is not null and ba_su.ba_unit_id= ba.id) as vl
from application.service s 
	inner join application.application_property ap on (s.application_id= ap.application_id)
	INNER JOIN administrative.ba_unit ba ON (ap.name_firstpart, ap.name_lastpart) = (ba.name_firstpart, ba.name_lastpart)
where s.id = #{id}
order by 1
limit 1');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('current-rrr-for-variation-or-cancellation-check', '2014-02-20', 'infinity', 'SELECT (SUM(1) > 0) AS vl FROM application.service sv 
			INNER JOIN application.application_property ap ON (sv.application_id = ap.application_id )
			  INNER JOIN administrative.ba_unit ba ON (ap.name_firstpart, ap.name_lastpart) = (ba.name_firstpart, ba.name_lastpart)
			  INNER JOIN administrative.rrr rr ON rr.ba_unit_id = ba.id
			  WHERE sv.id = #{id}
			  AND sv.request_type_code IN (SELECT code FROM application.request_type WHERE ((status = ''c'') AND (type_action_code IN (''vary'', ''cancel''))))
			  AND NOT(rr.is_primary)
			  AND rr.status_code = ''current''
LIMIT 1');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('power-of-attorney-owner-check', '2014-02-20', 'infinity', 'WITH poaQuery AS (SELECT person_name, py.name AS firstName, py.last_name AS lastName FROM transaction.transaction tn
			INNER JOIN administrative.rrr rr ON (tn.id = rr.transaction_id) 
			INNER JOIN administrative.ba_unit ba ON (rr.ba_unit_id = ba.id)
			INNER JOIN administrative.rrr r2 ON ((ba.id = r2.ba_unit_id) AND (r2.status_code = ''current'') AND r2.is_primary)
			INNER JOIN administrative.rrr_share rs ON (r2.id = rs.rrr_id)
			INNER JOIN administrative.party_for_rrr pr ON (rs.rrr_id = pr.rrr_id)
			INNER JOIN party.party py ON (pr.party_id = py.id)
			INNER JOIN administrative.source_describes_rrr sr ON (rr.id = sr.rrr_id)
			INNER JOIN source.power_of_attorney pa ON (sr.source_id = pa.id)
		WHERE tn.from_service_id = #{id})
SELECT CASE WHEN (COUNT(*) > 0) THEN TRUE
		ELSE NULL
	END AS vl FROM poaQuery
WHERE compare_strings(person_name, COALESCE(firstName, '''') || '' '' || COALESCE(lastName, ''''))
ORDER BY vl
LIMIT 1');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('service-has-person-verification', '2014-02-20', 'infinity', 'SELECT (CASE 	WHEN sv.application_id is  NULL THEN NULL
		ELSE COUNT(1) > 0
	 END) as vl
FROM application.service sv
  LEFT JOIN application.application_uses_source aus ON (aus.application_id = sv.application_id)
  LEFT JOIN source.source sc ON ((sc.id = aus.source_id) AND (sc.type_code = ''idVerification''))
WHERE sv.id= #{id}
GROUP BY sv.application_id
LIMIT 1');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('rrr-has-pending', '2014-02-20', 'infinity', 'select count(*) = 0 as vl
from administrative.rrr rrr1 inner join administrative.rrr rrr2 on (rrr1.ba_unit_id, rrr1.nr) = (rrr2.ba_unit_id, rrr2.nr)
where rrr1.id = #{id} and rrr2.id!=rrr1.id and rrr2.status_code = ''pending''
');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('rrr-shares-total-check', '2014-02-20', 'infinity', 'SELECT (SUM(nominator::DECIMAL/denominator::DECIMAL)*10000)::INT = 10000  AS vl
FROM   administrative.rrr_share 
WHERE  rrr_id = #{id}
AND    denominator != 0');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('application-baunit-check-area', '2014-02-20', 'infinity', 'select
       ( 
         select coalesce(cast(sum(a.size)as float),0)
	 from administrative.ba_unit_area a
         inner join administrative.ba_unit ba
         on a.ba_unit_id = ba.id
         where ba.transaction_id = #{id}
         and a.type_code =  ''officialArea''
       ) 
   = 

       (
         select coalesce(cast(sum(a.size)as float),0)
	 from cadastre.spatial_value_area a
	 where  a.type_code = ''officialArea''
	 and a.spatial_unit_id in
           (  select b.spatial_unit_id
              from administrative.ba_unit_contains_spatial_unit b
              inner join administrative.ba_unit ba
	      on b.ba_unit_id = ba.id
	      where ba.transaction_id = #{id}
           )

        ) as vl');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('baunit-has-multiple-mortgages', '2014-02-20', 'infinity', 'SELECT	(SELECT (COUNT(*) = 0) FROM application.service sv2
		 INNER JOIN transaction.transaction tn ON (sv2.id = tn.from_service_id)
		 INNER JOIN administrative.rrr rr ON (tn.id = rr.transaction_id)
		 INNER JOIN administrative.rrr rr2 ON ((rr.ba_unit_id = rr2.ba_unit_id) AND (rr2.type_code = ''mortgage'') AND (rr2.status_code =''current'') ) 
	WHERE sv.id = #{id}) AS vl FROM application.service sv
WHERE sv.id = #{id}
AND sv.request_type_code = ''mortgage''
ORDER BY 1
LIMIT 1');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('document-supporting-rrr-is-current', '2014-02-20', 'infinity', 'WITH serviceDocs AS	(SELECT DISTINCT ON (sc.id) sv.id AS sv_id, sc.id AS sc_id, sc.status_code, sc.type_code FROM application.service sv
				INNER JOIN transaction.transaction tn ON (sv.id = tn.from_service_id)
				INNER JOIN administrative.rrr rr ON (tn.id = rr.transaction_id)
				INNER JOIN administrative.source_describes_rrr sr ON (rr.id = sr.rrr_id)
				INNER JOIN source.source sc ON (sr.source_id = sc.id)
				WHERE sv.id = #{id}),
    nullDocs AS		(SELECT sc_id, type_code FROM serviceDocs WHERE status_code IS NULL),
    transDocs AS	(SELECT sc_id, type_code FROM serviceDocs WHERE status_code = ''current'' AND ((type_code = ''powerOfAttorney'') OR (type_code = ''standardDocument'')))
SELECT ((SELECT COUNT(*) FROM serviceDocs) - (SELECT COUNT(*) FROM nullDocs) - (SELECT COUNT(*) FROM transDocs) = 0) AS vl
ORDER BY 1
LIMIT 1');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('mortgage-value-check', '2014-02-20', 'infinity', 'SELECT (ap.total_value < rrr.amount) AS vl 
  from application.service s inner join application.application_property ap on s.application_id = ap.application_id 
 INNER JOIN administrative.ba_unit ba ON (ap.name_firstpart, ap.name_lastpart) = (ba.name_firstpart, ba.name_lastpart)
 INNER JOIN administrative.rrr ON rrr.ba_unit_id = ba.id
WHERE s.id = #{id} and rrr.type_code= ''mortgage'' and rrr.status_code in (''pending'')
order by 1
limit 1');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('power-of-attorney-service-has-document', '2014-02-20', 'infinity', 'SELECT (SUM(1) = 1) AS vl, get_translation(rt.display_value, #{lng}) as req_type FROM application.service sv
	 INNER JOIN transaction.transaction tn ON (sv.id = tn.from_service_id)
	 INNER JOIN source.source sc ON (tn.id = sc.transaction_id)
	 INNER JOIN application.request_type rt ON (sv.request_type_code = rt.code AND request_category_code = ''registrationServices'')
WHERE sv.id =#{id}
AND sc.type_code = ''powerOfAttorney''
GROUP BY rt.code
ORDER BY 1
LIMIT 1');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('required-sources-are-present', '2014-02-20', 'infinity', 'WITH reqForSv AS 	(SELECT r_s.source_type_code AS typeCode
			FROM application.request_type_requires_source_type r_s 
				INNER JOIN application.service sv ON((r_s.request_type_code = sv.request_type_code) AND (sv.status_code != ''cancelled''))
			WHERE sv.id = #{id}),
     inclInSv AS	(SELECT DISTINCT ON (sc.id) get_translation(rt.display_value, #{lng}) AS req_type FROM reqForSv req
				INNER JOIN source.source sc ON (req.typeCode = sc.type_code)
				INNER JOIN application.application_uses_source a_s ON (sc.id = a_s.source_id)
				INNER JOIN application.service sv ON ((a_s.application_id = sv.application_id) AND (sv.id = #{id}))
				INNER JOIN application.request_type rt ON (sv.request_type_code = rt.code))

SELECT 	CASE 	WHEN (SELECT (SUM(1) IS NULL) FROM reqForSv) THEN NULL
		WHEN ((SELECT COUNT(*) FROM inclInSv) - (SELECT COUNT(*) FROM reqForSv) >= 0) THEN TRUE
		ELSE FALSE
	END AS vl, req_type FROM inclInSv
ORDER BY vl
LIMIT 1');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('service-on-complete-without-transaction', '2014-02-20', 'infinity', 'select id in (select from_service_id from transaction.transaction where from_service_id is not null) as vl, 
  get_translation(r.display_value, #{lng}) as req_type
from application.service s inner join application.request_type r on s.request_type_code = r.code and request_category_code=''registrationServices''
and s.id= #{id}');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('service-title-terminated', '2014-02-20', 'infinity', 'WITH reqForSv AS 	(SELECT sv.id, get_translation(rt.display_value, #{lng}) AS req_type FROM application.service sv 
				INNER JOIN application.request_type rt ON (sv.request_type_code = rt.code)
			WHERE sv.id = #{id} 
			AND sv.request_type_code = ''cancelProperty''),
     checkTitle AS	(SELECT tg.ba_unit_id FROM application.service sv
				INNER JOIN transaction.transaction tn ON (sv.id = tn.from_service_id)
				INNER JOIN administrative.ba_unit_target tg ON (tn.id = tg.transaction_id)
			WHERE sv.id = #{id})
SELECT 	CASE 	WHEN (SELECT (COUNT(*) = 0) FROM reqForSv) THEN NULL
		WHEN (SELECT (COUNT(*) > 0) FROM checkTitle) THEN TRUE
		ELSE FALSE
	END AS vl, req_type FROM reqForSv
ORDER BY vl
LIMIT 1');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('service-check-no-previous-digital-title-service', '2014-02-20', 'infinity', 'SELECT coalesce(not rrr.is_primary, true) as vl
FROM application.service s inner join application.application_property ap on s.application_id = ap.application_id
  INNER JOIN administrative.ba_unit ba ON (ap.name_firstpart, ap.name_lastpart) = (ba.name_firstpart, ba.name_lastpart)
  LEFT JOIN administrative.rrr ON rrr.ba_unit_id = ba.id
WHERE s.id = #{id} 
order by 1 desc
limit 1');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('ba_unit-has-cadastre-object', '2014-02-20', 'infinity', 'SELECT count(*)>0 vl
from administrative.ba_unit_contains_spatial_unit ba_s 
WHERE ba_s.ba_unit_id = #{id}');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('ba_unit-has-compatible-cadastre-object', '2014-02-20', 'infinity', 'SELECT  co.type_code = ''parcel'' as vl
from administrative.ba_unit ba 
  inner join administrative.ba_unit_contains_spatial_unit ba_s on ba.id= ba_s.ba_unit_id
  inner join cadastre.cadastre_object co on ba_s.spatial_unit_id= co.id
WHERE ba.id = #{id} and ba.type_code= ''basicPropertyUnit''
order by case when co.type_code = ''parcel'' then 0 
		else 1 
	end
limit 1');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('application-br7-check-sources-have-documents', '2014-02-20', 'infinity', ' SELECT COUNT(*) = 0 AS vl,
       COALESCE(string_agg(s.la_nr, '', ''), '''') AS _$doc_list
 FROM  source.source s, 
       application.get_application_documents(#{id}) docs
 WHERE s.id = docs.doc_id
 AND   s.ext_archive_id IS NULL ');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('newtitle-br22-check-different-owners', '2014-02-20', 'infinity', 'WITH new_property_owner AS (
	SELECT  COALESCE(name, '''') || '' '' || COALESCE(last_name, '''') AS newOwnerStr FROM party.party po
		INNER JOIN administrative.party_for_rrr pfr1 ON (po.id = pfr1.party_id)
		INNER JOIN administrative.rrr rr1 ON (pfr1.rrr_id = rr1.id)
	WHERE rr1.ba_unit_id = #{id}),
	
  prior_property_owner AS (
	SELECT  COALESCE(name, '''') || '' '' || COALESCE(last_name, '''') AS priorOwnerStr FROM party.party pn
		INNER JOIN administrative.party_for_rrr pfr2 ON (pn.id = pfr2.party_id)
		INNER JOIN administrative.rrr rr2 ON (pfr2.rrr_id = rr2.id)
		INNER JOIN administrative.required_relationship_baunit rfb ON (rr2.ba_unit_id = rfb.from_ba_unit_id)
	WHERE	rfb.to_ba_unit_id = #{id}
	LIMIT 1	)

SELECT 	CASE 	WHEN (SELECT (COUNT(*) = 0) FROM prior_property_owner) THEN NULL
		WHEN (SELECT (COUNT(*) != 0) FROM new_property_owner npo WHERE compare_strings((SELECT priorOwnerStr FROM prior_property_owner), npo.newOwnerStr)) THEN TRUE
		ELSE FALSE
	END AS vl
ORDER BY vl
LIMIT 1');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('cadastre-redefinition-target-geometries-dont-overlap', '2014-02-20', 'infinity', 'select coalesce(st_area(st_union(co.geom_polygon)) = sum(st_area(co.geom_polygon)), true) as vl
from cadastre.cadastre_object_target co where transaction_id = #{id}');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('area-check-percentage-newareas-oldareas', '2014-02-20', 'infinity', 'select abs((select cast(sum(a.size)as float)
	from cadastre.spatial_value_area a
	where a.type_code = ''officialArea''
        and a.spatial_unit_id in (
	   select co_new.id
		from cadastre.cadastre_object co_new 
		where co_new.transaction_id = #{id}))
 -
   (select cast(sum(a.size)as float)
	from cadastre.spatial_value_area a
	where a.type_code = ''officialArea''
	and a.spatial_unit_id in ( 
	      select co_target.cadastre_object_id
		from cadastre.cadastre_object_target co_target
		    where co_target.transaction_id = #{id})) 
 ) /(select cast(sum(a.size)as float)
	from cadastre.spatial_value_area a
	where a.type_code = ''officialArea''
	and a.spatial_unit_id in ( 
	      select co_target.cadastre_object_id
		from cadastre.cadastre_object_target co_target
		    where co_target.transaction_id = #{id})) 
 < 0.001 as vl');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('cadastre-redefinition-union-old-new-the-same', '2014-02-20', 'infinity', 'select st_equals(geom_to_snap,target_geom) as vl from cadastre.snap_geometry_to_geometry((select st_union(co.geom_polygon) from cadastre.cadastre_object co 
 where id in (select cadastre_object_id from cadastre.cadastre_object_target co_t where transaction_id = #{id})), 
(select st_union(co_t.geom_polygon) from cadastre.cadastre_object_target co_t where transaction_id = #{id}), 
 system.get_setting(''map-tolerance'')::double precision, true)');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('new-cadastre-objects-do-not-overlap', '2014-02-20', 'infinity', 'WITH tolerance AS (SELECT CAST(ABS(LOG((CAST (vl AS NUMERIC)^2))) AS INT) AS area FROM system.setting where name = ''map-tolerance'' LIMIT 1)

SELECT COALESCE(ROUND(CAST (ST_AREA(ST_UNION(co.geom_polygon))AS NUMERIC), (SELECT area FROM tolerance)) = 
		ROUND(CAST(SUM(ST_AREA(co.geom_polygon))AS NUMERIC), (SELECT area FROM tolerance)), 
		TRUE) AS vl
FROM cadastre.cadastre_object co 
WHERE transaction_id = #{id} ');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('new-cadastre-objects-present', '2014-02-20', 'infinity', 'select count (*) > 0 as vl from cadastre.cadastre_object where transaction_id= #{id}');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('target-and-new-union-the-same', '2014-02-20', 'infinity', 'select st_equals(geom_to_snap,target_geom) as vl
from cadastre.snap_geometry_to_geometry(
(select st_union(co.geom_polygon) 
from cadastre.cadastre_object co where transaction_id = #{id})
, (select st_union(co.geom_polygon)
from cadastre.cadastre_object co 
where id in (select cadastre_object_id 
  from cadastre.cadastre_object_target  where transaction_id = #{id})), 
  system.get_setting(''map-tolerance'')::double precision, true)
 ');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('target-parcels-check-isapolygon', '2014-02-20', 'infinity', 'select St_GeometryType(ST_Union(co.geom_polygon)) = ''ST_Polygon'' as vl
 from cadastre.cadastre_object co 
  inner join cadastre.cadastre_object_target co_target
   on co.id = co_target.cadastre_object_id
    where co_target.transaction_id = #{id}');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('target-parcels-check-nopending', '2014-02-20', 'infinity', 'select (select count(*)=0 
  from cadastre.cadastre_object_target target_also inner join transaction.transaction t 
    on target_also.transaction_id = t.id and t.status_code not in (''approved'')
  where co_target.transaction_id != target_also.transaction_id
    and co_target.cadastre_object_id= target_also.cadastre_object_id) as vl
from cadastre.cadastre_object_target co_target
where co_target.transaction_id = #{id}
 ');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('target-parcels-present', '2014-02-20', 'infinity', 'select count (*) > 0 as vl from cadastre.cadastre_object_target where transaction_id= #{id}');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('survey-points-present', '2014-02-20', 'infinity', 'select count (*) > 2  as vl from cadastre.survey_point where transaction_id= #{id}');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('ba_unit-has-several-mortgages-with-same-rank', '2014-02-20', 'infinity', 'WITH	simple	AS	(SELECT rr1.id, rr1.nr FROM administrative.rrr rr1
				INNER JOIN administrative.ba_unit ba1 ON (rr1.ba_unit_id = ba1.id)
				INNER JOIN administrative.rrr rr2 ON ((ba1.id = rr2.ba_unit_id) AND (rr1.mortgage_ranking = rr2.mortgage_ranking))
			WHERE rr2.id = #{id}
			AND rr1.type_code = ''mortgage''
			AND rr1.status_code = ''current''
			AND (rr1.mortgage_ranking = rr2.mortgage_ranking)),
	complex	AS	(SELECT rr3.id, rr3.nr FROM administrative.rrr rr3
				INNER JOIN administrative.ba_unit ba2 ON (rr3.ba_unit_id = ba2.id)
				INNER JOIN administrative.rrr rr4 ON (ba2.id = rr4.ba_unit_id)
			WHERE rr4.id = #{id}
			AND rr3.type_code = ''mortgage''
			AND rr3.status_code != ''current''
			AND rr3.mortgage_ranking = rr4.mortgage_ranking
			AND rr3.nr IN (SELECT nr FROM simple))

SELECT CASE 	WHEN	((SELECT rr5.id FROM administrative.rrr rr5 WHERE rr5.id = #{id} AND rr5.type_code = ''mortgage'') IS NULL) THEN NULL
		WHEN 	(SELECT (COUNT(*) = 0) FROM simple) THEN TRUE
		WHEN 	(((SELECT COUNT(*) FROM simple) - (SELECT COUNT(*) FROM complex) = 0)) THEN TRUE
		ELSE	FALSE
	END AS vl');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('cadastre-object-check-name', '2014-02-20', 'infinity', 'SELECT  FALSE AS vl,
           string_agg(COALESCE(co.name_firstpart, '''') || '' '' || COALESCE(co.name_lastpart, ''''), '', '') AS _$parcel_list
   FROM    cadastre.cadastre_object co
   WHERE   co.transaction_id = #{id} 
   AND     co.type_code = ''stateLand''
   AND     cadastre.cadastre_object_name_is_valid(TRIM(co.name_firstpart), TRIM(co.name_lastpart)) = FALSE
   GROUP BY vl');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('ba_unit-has-caveat', '2014-02-20', 'infinity', 'WITH caveatCheck AS	(SELECT COUNT(*) AS present FROM administrative.rrr rr2 
				 INNER JOIN administrative.ba_unit ba ON (rr2.ba_unit_id = ba.id)
				 INNER JOIN administrative.rrr rr1 ON ((ba.id = rr1.ba_unit_id) AND (rr1.type_code = ''caveat'') AND (rr1.status_code IN (''pending'', ''current'')))
			 WHERE rr2.id = #{id}
			 ORDER BY 1
			 LIMIT 1),
    changeCheck AS	(SELECT (COUNT(*) > 0) AS caveatChange FROM administrative.rrr rr2 
				 INNER JOIN administrative.ba_unit ba ON (rr2.ba_unit_id = ba.id)
				 INNER JOIN administrative.rrr rr3 ON ((ba.id = rr3.ba_unit_id) AND (rr3.type_code = ''caveat'') AND (rr3.status_code = ''current''))
				 INNER JOIN transaction.transaction tn ON (rr3.transaction_id = tn.id)
				 INNER JOIN application.service sv1 ON ((tn.from_service_id = sv1.id) AND sv1.request_type_code IN (''varyCaveat'', ''removeCaveat'') AND sv1.status_code IN (''lodged'', ''pending''))
			 WHERE rr2.id = #{id}),
	varyCheck AS 	(SELECT ((SELECT present FROM caveatCheck) - (SELECT SUM(1) FROM (SELECT DISTINCT ON (rr4.nr) rr4.nr FROM administrative.rrr rr2 
									 INNER JOIN administrative.ba_unit ba ON (rr2.ba_unit_id = ba.id) 
									 INNER JOIN administrative.rrr rr3 ON ((ba.id = rr3.ba_unit_id) AND (rr3.type_code = ''caveat'') AND (rr3.status_code = ''current''))
									 INNER JOIN transaction.transaction tn ON (rr3.transaction_id = tn.id) 
									 INNER JOIN application.service sv1 ON ((tn.from_service_id = sv1.id) AND (sv1.request_type_code = ''varyCaveat''))
									 INNER JOIN administrative.rrr rr4 ON ((ba.id = rr4.ba_unit_id) AND (rr3.nr = rr4.nr))
								WHERE rr2.id = #{id}) AS vary) = 0) AS withoutVary), 
     caveatRegn AS	(SELECT (COUNT(*) > 0) AS caveat FROM administrative.rrr rr4
				 INNER JOIN transaction.transaction tn ON ((rr4.transaction_id = tn.id)	AND (rr4.status_code IN (''pending'', ''current'')) AND (rr4.type_code = ''caveat''))
				 INNER JOIN application.service sv2 ON (tn.from_service_id = sv2.id)
			WHERE rr4.id = #{id}
			AND (SELECT (COUNT(*) = 0) FROM application.service sv3 WHERE ((sv3.application_id = sv2.application_id) AND (sv3.status_code != ''cancelled'') AND (sv3.request_type_code NOT IN (''caveat'', ''varyCaveat'', ''removeCaveat''))))
			ORDER BY 1
			LIMIT 1)
			
SELECT (SELECT	CASE 	WHEN (SELECT caveat FROM caveatRegn) THEN TRUE
			WHEN (SELECT caveatChange FROM changeCheck) THEN TRUE
			WHEN (SELECT withoutVary FROM varyCheck) THEN TRUE
			WHEN (SELECT (present = 0) FROM caveatCheck)THEN NULL
			WHEN (SELECT (present > 0) FROM caveatCheck) THEN FALSE
			ELSE TRUE
		END) AS vl');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('source-attach-in-transaction-no-pendings', '2014-02-20', 'infinity', 'WITH checkServiceType	AS	(SELECT COUNT(*) AS cnt FROM application.service sv1
					INNER JOIN transaction.transaction tn ON (sv1.id = tn.from_service_id)
					INNER JOIN source.source sc1 ON (tn.id = sc1.transaction_id)
				 WHERE sc1.id = #{id}
				 AND sv1.request_type_code IN (''regnPowerOfAttorney'', ''regnStandardDocument'')),
	checkSource	AS	(SELECT COUNT(*) AS cnt FROM source.source sc2
				 WHERE sc2.id = #{id}
				 AND sc2.status_code = ''pending'')

SELECT	CASE 	WHEN (SELECT (cnt = 0) FROM checkServiceType) THEN NULL
		WHEN (SELECT (cnt = 0) FROM checkSource) THEN TRUE
		ELSE FALSE
	END AS vl');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('source-attach-in-transaction-allowed-type', '2014-02-20', 'infinity', 'WITH checkServiceType	AS	(SELECT COUNT(*) AS cnt FROM application.service sv1
					INNER JOIN transaction.transaction tn ON (sv1.id = tn.from_service_id)
					INNER JOIN source.source sc1 ON (tn.id = sc1.transaction_id)
				 WHERE tn.id = #{id}
				 AND sv1.request_type_code IN (''regnPowerOfAttorney'', ''regnStandardDocument'')),
	allSource	AS	(SELECT sc2.id AS sid FROM source.source sc2
				 WHERE sc2.transaction_id = #{id}),
	checkSource	AS	(SELECT sid FROM allSource
				 WHERE sid IN (SELECT sc3.id FROM source.source sc3
							INNER JOIN source.administrative_source_type st ON (sc3.type_code = st.code)
						WHERE sc3.id = #{id}
						AND st.is_for_registration
						AND st.status = ''c''))

SELECT	CASE 	WHEN (SELECT (cnt = 0) FROM checkServiceType) THEN NULL
		WHEN (SELECT ((SELECT COUNT(*) FROM allSource) - (SELECT COUNT(*) FROM checkSource)) = 0) THEN TRUE
		ELSE FALSE
	END AS vl');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('bulk-spatial-geom-overlaps-with-loading-geom', '2014-02-20', 'infinity', 'select (select count(1)=0
  from bulk_operation.spatial_unit_temporary tmp, bulk_operation.spatial_unit_temporary tmp2
  where tmp.transaction_id = tmp2.transaction_id and tmp.id != tmp2.id and tmp.geom && tmp2.geom 
    and st_intersects(tmp.geom, st_buffer(tmp2.geom, - system.get_setting(''map-tolerance'')::double precision))) as vl
from transaction.transaction t
where id = #{id}
  and id in (select transaction_id 
    from bulk_operation.spatial_unit_temporary 
    where type_code = ''cadastre_object'')
');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('bulk-spatial-geom-overlaps-with-existing', '2014-02-20', 'infinity', 'select (select count(1)=0
  from bulk_operation.spatial_unit_temporary tmp, cadastre.cadastre_object co
  where tmp.transaction_id = t.id and tmp.geom && co.geom_polygon 
    and st_intersects(co.geom_polygon, st_buffer(tmp.geom, - system.get_setting(''map-tolerance'')::double precision))) as vl
from transaction.transaction t
where id = #{id}
  and id in (select transaction_id 
    from bulk_operation.spatial_unit_temporary 
    where type_code = ''cadastre_object'')
');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('bulk-spatial-geom-not-valid', '2014-02-20', 'infinity', 'select (select count(1)=0
  from bulk_operation.spatial_unit_temporary tmp
  where tmp.transaction_id = t.id 
    and not (st_isvalid(tmp.geom) 
    and st_geometrytype(tmp.geom) = ''ST_Polygon'')) as vl
from transaction.transaction t
where id = #{id}
  and id in (select transaction_id 
    from bulk_operation.spatial_unit_temporary 
    where type_code = ''cadastre_object'')
');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('bulk-spatial-name-unique', '2014-02-20', 'infinity', 'select (select count(1)=0
  from bulk_operation.spatial_unit_temporary 
  where transaction_id = t.id
   and (name_firstpart, name_lastpart) in (select name_firstpart, name_lastpart 
    from cadastre.cadastre_object)) as vl
from transaction.transaction t
where id = #{id}
  and id in (select transaction_id 
    from bulk_operation.spatial_unit_temporary 
    where type_code = ''cadastre_object'')
');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('spatial-unit-group-not-overlap', '2014-02-20', 'infinity', 'select count(*) =0 as vl
from cadastre.spatial_unit_group sug1, cadastre.spatial_unit_group sug2
where sug1.hierarchy_level = sug2.hierarchy_level and sug1.id > sug2.id
  and st_intersects(sug1.geom, st_buffer(sug2.geom, -0.5))');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('spatial-unit-group-inside-other-spatial-unit-group', '2014-02-20', 'infinity', 'select count(*)= 0 as vl
from cadastre.spatial_unit_group 
where hierarchy_level !=0 and id not in (
  select sug1.id
  from cadastre.spatial_unit_group sug1, cadastre.spatial_unit_group sug2
  where sug1.hierarchy_level = sug2.hierarchy_level + 1
    and st_within(st_buffer(sug1.geom, -0.5), sug2.geom)
)');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('spatial-unit-group-name-unique', '2014-02-20', 'infinity', 'select count(*)=0 as vl
from (
select count(*)
from cadastre.spatial_unit_group
group by name
having count(*)>1) as tmp');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('public-display-check-baunit-has-co', '2014-02-20', 'infinity', 'SELECT count(bu.id) = 0 as vl
   FROM  application.application_property ap, 
   application.application aa, 
   application.service s,
   administrative.ba_unit bu
  WHERE 
   ap.ba_unit_id::text = bu.id::text 
   AND aa.id::text = ap.application_id::text 
   AND s.application_id::text = aa.id::text
   AND aa.id::text in (
   SELECT 
    aa.id id
   FROM 
   cadastre.cadastre_object co, cadastre.spatial_value_area sa, 
   administrative.ba_unit_contains_spatial_unit su, application.application_property ap, 
   application.application aa, application.service s
  WHERE sa.spatial_unit_id::text = co.id::text 
  AND sa.type_code::text = ''officialArea''::text AND su.spatial_unit_id::text = sa.spatial_unit_id::text 
  AND ap.ba_unit_id::text = su.ba_unit_id::text AND aa.id::text = ap.application_id::text AND s.application_id::text = aa.id::text
   AND s.request_type_code::text = ''systematicRegn''::text AND s.status_code::text = ''completed''::text 
   AND co.name_lastpart = #{lastPart}
    )
   AND s.request_type_code::text = ''systematicRegn''::text 
   AND s.status_code::text = ''completed''::text 
   AND  bu.id not in (
   select su.ba_unit_id
   from  
   administrative.ba_unit_contains_spatial_unit su
   )');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('public-display-check-complete-status', '2014-02-20', 'infinity', 'select
(select count(*)
from cadastre.cadastre_object co 
  INNER JOIN administrative.ba_unit_contains_spatial_unit ba_su on (co.id= ba_su.spatial_unit_id)
  INNER JOIN administrative.ba_unit bu on (bu.id= ba_su.ba_unit_id)
  INNER JOIN application.application_property ap on (bu.id= ap.ba_unit_id)
  INNER JOIN application.application a on (a.id= ap.application_id)
  INNER JOIN application.service s on (a.id= s.application_id and s.request_type_code=''systematicRegn'')
  where co.name_lastpart = #{lastPart})
/
(case when (select count(*)
from cadastre.cadastre_object co 
  INNER JOIN administrative.ba_unit_contains_spatial_unit ba_su on (co.id= ba_su.spatial_unit_id)
  INNER JOIN administrative.ba_unit bu on (bu.id= ba_su.ba_unit_id)
  INNER JOIN application.application_property ap on (bu.id= ap.ba_unit_id)
  INNER JOIN application.application a on (a.id= ap.application_id)
  INNER JOIN application.service s on (a.id= s.application_id and s.request_type_code=''systematicRegn'' and s.status_code=''completed'')
  where co.name_lastpart = #{lastPart}) = 0 then 1
  else  (select count(*)
from cadastre.cadastre_object co 
  INNER JOIN administrative.ba_unit_contains_spatial_unit ba_su on (co.id= ba_su.spatial_unit_id)
  INNER JOIN administrative.ba_unit bu on (bu.id= ba_su.ba_unit_id)
  INNER JOIN application.application_property ap on (bu.id= ap.ba_unit_id)
  INNER JOIN application.application a on (a.id= ap.application_id)
  INNER JOIN application.service s on (a.id= s.application_id and s.request_type_code=''systematicRegn'' and s.status_code=''completed'')
  where co.name_lastpart = #{lastPart})
 end 
  ) * 100
> 90 as vl
');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('consolidation-db-structure-the-same', '2014-02-20', 'infinity', '
with def_of_tables as (select source_table_name, target_table_name, (select string_agg(col_definition, ''##'') from (select column_name || '' '' 
      || udt_name 
      || coalesce(''('' || character_maximum_length || '')'', '''') 
        || case when udt_name = ''numeric'' then ''('' || numeric_precision || '','' || numeric_scale  || '')'' else '''' end as col_definition
      from information_schema.columns cols
      where cols.table_schema || ''.'' || cols.table_name = config.source_table_name) as ttt) as source_def,
      (select string_agg(col_definition, ''##'') from (select column_name || '' '' 
      || udt_name 
      || coalesce(''('' || character_maximum_length || '')'', '''') 
        || case when udt_name = ''numeric'' then ''('' || numeric_precision || '','' || numeric_scale  || '')'' else '''' end as col_definition
      from information_schema.columns cols
      where cols.table_schema || ''.'' || cols.table_name = config.target_table_name) as ttt) as target_def      
from consolidation.config config)
select count(*)=0 as vl from def_of_tables where source_def != target_def
');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('generate-claim-nr', '2014-02-20', 'infinity', 'SELECT coalesce(system.get_setting(''system-id''), '''') || to_char(now(), ''yymm'') || trim(to_char(nextval(''opentenure.claim_nr_seq''), ''0000'')) AS vl');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('generate-baunit-nr', '2014-02-20', 'infinity', 'SELECT CASE WHEN #{typeCode} = ''stateLand'' THEN ''SL/'' || trim(to_char(nextval(''administrative.state_land_num_seq''), ''000000''))
        ELSE coalesce(system.get_setting(''system-id''), '''') || to_char(now(), ''yymm'') 
        || trim(to_char(nextval(''administrative.ba_unit_first_name_part_seq''), ''0000''))
        || ''/'' || trim(to_char(nextval(''administrative.ba_unit_last_name_part_seq''), ''0000'')) END AS vl');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('target-ba_unit-check-if-pending', '2014-02-20', 'infinity', 'WITH	otherCancel AS	(SELECT (SELECT (COUNT(*) = 0)FROM administrative.ba_unit_target ba_t2 
				INNER JOIN transaction.transaction tn ON (ba_t2.transaction_id = tn.id)
				WHERE ba_t2.ba_unit_id = ba_t.ba_unit_id
				AND ba_t2.transaction_id != ba_t.transaction_id
				AND tn.status_code != ''approved'') AS chkOther
			FROM administrative.ba_unit_target ba_t
			WHERE ba_t.ba_unit_id = #{id}), 
	cancelAp AS	(SELECT ap.id FROM administrative.ba_unit_target ba_t 
			INNER JOIN application.application_property pr ON (ba_t.ba_unit_id = pr.ba_unit_id)
			INNER JOIN application.service sv ON (pr.application_id = sv.application_id)
			INNER JOIN application.application ap ON (pr.application_id = ap.id)
			WHERE ba_t.ba_unit_id = #{id}
			AND sv.request_type_code IN (''cancelProperty'', ''disposeSLProperty'')
			AND sv.status_code != ''cancelled''
			AND ap.status_code NOT IN (''annulled'', ''approved'')),
	otherAps AS	(SELECT (SELECT (count(*) = 0) FROM administrative.ba_unit ba
			INNER JOIN administrative.rrr rr ON (ba.id = rr.ba_unit_id)
			INNER JOIN transaction.transaction tn ON (rr.transaction_id = tn.id)
			INNER JOIN application.service sv ON (tn.from_service_id = sv.id)
			INNER JOIN application.application ap ON (sv.application_id = ap.id)
			WHERE ba.id = #{id} 
			AND ap.status_code = ''lodged''
			AND ap.id NOT IN (SELECT id FROM cancelAp)) AS chkNoOtherAps),

	pendingRRR AS	(SELECT (SELECT (count(*) = 0) FROM administrative.rrr rr
				INNER JOIN administrative.ba_unit_target ba_t2 ON (rr.ba_unit_id = ba_t2.ba_unit_id)
				INNER JOIN transaction.transaction t2 ON (ba_t2.transaction_id = t2.id)
				INNER JOIN application.service s2 ON (t2.from_service_id = s2.id) 
				WHERE ba_t2.ba_unit_id = ba_t.ba_unit_id
				AND s2.application_id != s1.application_id
				AND ba_t2.transaction_id != ba_t.transaction_id
				AND rr.status_code = ''pending'') AS chkPend 
			FROM administrative.ba_unit_target ba_t
			INNER JOIN transaction.transaction t1 ON (ba_t.transaction_id = t1.id)
			INNER JOIN application.service s1 ON (t1.from_service_id = s1.id) 
			WHERE ba_t.ba_unit_id = #{id})
SELECT ((SELECT chkPend  FROM pendingRRR) AND (SELECT chkOther FROM otherCancel)  AND (SELECT chkNoOtherAps FROM otherAps)) AS vl 
FROM administrative.ba_unit_target tg
WHERE tg.ba_unit_id  = #{id}');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('ba_unit-has-a-valid-primary-right', '2014-02-20', 'infinity', 'SELECT (COUNT(*) = 1) AS vl, 
	 administrative.get_property_name(ba.id) AS _$property_name
	 FROM administrative.rrr rr1 
	 INNER JOIN administrative.ba_unit ba ON (rr1.ba_unit_id = ba.id)
	 INNER JOIN transaction.transaction tn ON (rr1.transaction_id = tn.id)
	 INNER JOIN application.service sv ON ((tn.from_service_id = sv.id) 
	      AND (sv.request_type_code NOT IN (''cancelProperty'', ''disposeSLProperty'')))
 WHERE ba.id = #{id}
 AND rr1.status_code != ''cancelled''
 AND rr1.is_primary
 AND rr1.type_code IN (''ownership'', ''apartment'', ''stateOwnership'', ''lease'')
 GROUP BY ba.id ');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('ba_unit-spatial_unit-area-comparison', '2014-02-20', 'infinity', 'WITH parcel_area AS (
SELECT COALESCE(SUM(sva.size),0) AS p_area
FROM   administrative.ba_unit_contains_spatial_unit bas,
       cadastre.cadastre_object co,
       cadastre.spatial_value_area sva
WHERE  bas.ba_unit_id = #{id}
AND    co.id = bas.spatial_unit_id
AND    co.status_code != ''historic''
AND    sva.spatial_unit_id = co.id
AND    sva.type_code = ''officialArea''
AND    NOT EXISTS (SELECT cot.cadastre_object_id
                   FROM cadastre.cadastre_object_target cot
                   WHERE cot.cadastre_object_id = co.id))
SELECT ABS((COALESCE(baa.size, 0) - parea)) < (p_area * 0.01) AS vl,
       TRIM(cadastre.format_area_metric(p_area)) AS _$parcel_area,
       TRIM(cadastre.format_area_metric(COALESCE(baa.size, 0))) AS _$property_area
FROM   administrative.ba_unit ba LEFT OUTER JOIN administrative.ba_unit_area baa 
       ON ba.id = baa.ba_unit_id AND baa.type_code = ''officialArea'',
       parcel_area
WHERE  ba.id = #{id}');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('area-check-percentage-newofficialarea-calculatednewarea', '2014-02-20', 'infinity', 'WITH parcel_area AS (
SELECT co.id AS co_id,
       COALESCE(sva.size,0) AS p_area,
       COALESCE(st_area(geom_polygon),0) AS c_area,
       ABS(COALESCE(sva.size,0) - COALESCE(st_area(geom_polygon),0)) 
           <  (COALESCE(sva.size,0) * 0.01) AS within_tolerance
FROM   cadastre.cadastre_object co LEFT OUTER JOIN cadastre.spatial_value_area sva
       ON co.id = sva.spatial_unit_id AND sva.type_code = ''officialArea''
WHERE  co.transaction_id = #{id})
SELECT COUNT(*) = 0 AS vl,
       string_agg(COALESCE(co.name_firstpart, '''') || '' '' || COALESCE(co.name_lastpart, '''') 
       || '' (Calc:'' || TRIM(cadastre.format_area_metric(c_area::NUMERIC)) || '')'', '', '') AS _$parcel_list
FROM   cadastre.cadastre_object co, 
       parcel_area
WHERE  within_tolerance = FALSE
AND    co.id = co_id');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('application-br4-check-sources-date-not-in-the-future', '2014-02-20', 'infinity', ' SELECT COUNT(*) = 0 AS vl,
       COALESCE(string_agg(s.la_nr, '', ''), '''') AS _$doc_list
 FROM  source.source s, 
       application.get_application_documents(#{id}) docs
 WHERE s.id = docs.doc_id
 AND   s.recordation < NOW() ');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('rrr-must-have-parties', '2014-02-20', 'infinity', ' SELECT FALSE AS vl,
  COALESCE(get_translation(rt.display_value, #{sql_param_languageCode}), '''') AS _$rrr_type,
  administrative.get_property_name(r.ba_unit_id) AS _$property_name
FROM administrative.rrr r,
     administrative.rrr_type rt
WHERE r.id = #{id} 
AND   rt.code = r.type_code 
AND   rt.party_required = TRUE
AND   NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = r.id)');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('ba-unit-has-spatial-parcels', '2014-02-20', 'infinity', 'SELECT  FALSE AS vl,
            string_agg(COALESCE(co.name_firstpart, '''') || '' '' || COALESCE(co.name_lastpart, ''''), '', '') AS _$parcel_list,
			administrative.get_property_name(ba.id) AS _$property_name
    FROM    administrative.ba_unit ba,
            administrative.ba_unit_contains_spatial_unit bas,
            cadastre.cadastre_object co
    WHERE   ba.id = #{id}
    AND     ba.type_code= ''stateLand''
    AND     bas.ba_unit_id = ba.id
    AND     co.id = bas.spatial_unit_id
    AND     co.geom_polygon IS NULL
    GROUP BY vl, _$property_name');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('ba-unit-has-notes-to-action', '2014-02-20', 'infinity', 'SELECT  FALSE AS vl,
            string_agg(COALESCE(note.reference_nr, ''No Ref.#''), '', '') AS _$notes_list,
            administrative.get_property_name(ba.id) AS _$property_name
	FROM    administrative.ba_unit ba,
			administrative.notation note
	WHERE   ba.id = #{id}
	AND     ba.type_code= ''stateLand''
	AND     note.ba_unit_id = ba.id
	AND     note.status_code IN (''actionReqd'', ''actionReqdUrgent'')
	GROUP BY vl, _$property_name');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('parcel-name-duplicated', '2014-02-20', 'infinity', 'WITH dup_parcels AS (
  SELECT DISTINCT co.id AS dup_id
  FROM   cadastre.cadastre_object co,
         cadastre.cadastre_object co_dup
  WHERE  co.transaction_id = #{id}
  AND    TRIM(co.name_firstpart) = TRIM(co_dup.name_firstpart)
  AND    TRIM(co.name_lastpart) = TRIM(co_dup.name_lastpart)
  AND    co_dup.status_code IN (''current'', ''pending'')
  AND    co_dup.type_code = co.type_code
  AND    co_dup.id != co.id
  AND    co_dup.id NOT IN (SELECT cot.cadastre_object_id
                           FROM   cadastre.cadastre_object_target cot
                           WHERE  cot.transaction_id = co.transaction_id))
SELECT COUNT(dup_id) = 0 AS vl,
       COUNT(dup_id) AS _$rule_count,
       CASE WHEN COUNT(dup_id) = 0 THEN ''''
	      ELSE string_agg(COALESCE(name_firstpart, '''') || '' '' || COALESCE(name_lastpart, ''''), '', '') 
	   END AS _$parcel_list
FROM   dup_parcels
       LEFT OUTER JOIN cadastre.cadastre_object ON id = dup_id');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('property-compenstation-comparison', '2014-02-20', 'infinity', 'WITH tmp AS (
SELECT DISTINCT ABS(COALESCE(initial_amount, 0) - COALESCE(final_amount, 0)) 
              < (COALESCE(initial_amount, 0) * 0.1) AS within_tolerance,
       ba_unit_id
FROM   application.negotiate
WHERE  service_id = #{id}
AND    final_amount > initial_amount)
SELECT COUNT(*) = 0 AS vl,
       COALESCE(string_agg(administrative.get_property_name(ba_unit_id), '', ''), '''') AS _$property_list
FROM   tmp
WHERE  within_tolerance = FALSE');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('ba-unit-has-land-use', '2014-02-20', 'infinity', 'SELECT  administrative.get_land_use_code(ba.id) IS NOT NULL AS vl,
            COALESCE(administrative.get_property_name(ba.id), '''') AS _$property_name 
	FROM    administrative.ba_unit ba		
	WHERE   ba.id = #{id}');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('rrr-has-conditions', '2014-02-20', 'infinity', ' SELECT  CASE WHEN EXISTS (SELECT rrr_id FROM administrative.condition_for_rrr cond 
                               WHERE cond.rrr_id = r.id) THEN TRUE ELSE FALSE END AS vl,
             COALESCE(administrative.get_property_name(r.ba_unit_id), '''') AS _$property_name,
	         COALESCE(get_translation(rt.display_value, #{sql_param_languageCode}), '''') AS _$rrr_type
	FROM    administrative.rrr r,
            administrative.rrr_type rt	
	WHERE   r.id = #{id}
	AND     rt.code = r.type_code
	AND     r.type_code IN (''lease'', ''license'')');
INSERT INTO br_definition (br_id, active_from, active_until, body) VALUES ('cancel-title-check-rrr-cancelled', '2014-02-20', 'infinity', ' WITH 	pending_property_rrr AS (SELECT DISTINCT ON(rr1.nr) rr1.nr FROM administrative.rrr rr1 
				INNER JOIN transaction.transaction tn ON (rr1.transaction_id = tn.id)
				INNER JOIN application.service sv1 ON (tn.from_service_id = sv1.id) 
				WHERE sv1.application_id = #{id}
				AND rr1.status_code = ''pending''),
								
	target_title	AS	(SELECT prp.ba_unit_id AS liveTitle FROM application.application_property prp
				WHERE prp.application_id = #{id}),
				
	cancelPropApp	AS	(SELECT sv3.id AS fhCheck, sv3.request_type_code FROM application.service sv3
				WHERE sv3.application_id = #{id}
				AND sv3.request_type_code IN ( ''cancelProperty'', ''disposeSLProperty'')
				AND sv3.status_code != ''cancelled''),
					
	current_rrr AS 		(SELECT DISTINCT ON(rr2.nr) rr2.nr FROM administrative.rrr rr2 
				WHERE rr2.status_code = ''current''
				AND rr2.ba_unit_id IN (SELECT liveTitle FROM target_title)),

	rem_property_rrr AS	(SELECT nr FROM current_rrr WHERE nr NOT IN (SELECT nr FROM pending_property_rrr))
				
SELECT CASE 	WHEN (SELECT (COUNT(*) = 0) FROM cancelPropApp) THEN NULL
		WHEN (SELECT (COUNT(*) = 0) FROM pending_property_rrr) THEN FALSE
		WHEN (SELECT (COUNT(*) = 0) FROM rem_property_rrr) THEN TRUE
		ELSE FALSE
	END AS vl');


ALTER TABLE br_definition ENABLE TRIGGER ALL;

--
-- Data for Name: br_validation; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE br_validation DISABLE TRIGGER ALL;

INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('beede1a6-99dd-11e3-b037-9b875b755c8b', 'application-br4-check-sources-date-not-in-the-future', 'application', 'validate', NULL, NULL, NULL, NULL, 'warning', 710);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('beefb670-99dd-11e3-80be-5f1f7d0be252', 'application-on-approve-check-services-status', 'application', 'approve', NULL, NULL, NULL, NULL, 'critical', 270);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('bef2c3ba-99dd-11e3-8a92-9fe0710c1de1', 'application-br8-check-has-services', 'application', 'validate', NULL, NULL, NULL, NULL, 'critical', 260);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('bef47174-99dd-11e3-a840-57d6651e3211', 'newtitle-br24-check-rrr-accounted', 'application', 'validate', NULL, NULL, NULL, NULL, 'critical', 160);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('bef8b73e-99dd-11e3-a4e4-cb550d80f143', 'cancel-title-check-rrr-cancelled', 'application', 'validate', NULL, NULL, NULL, NULL, 'critical', 150);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('bf195f16-99dd-11e3-bdce-c74f42f9154c', 'application-baunit-check-area', 'service', NULL, NULL, NULL, 'cadastreChange', NULL, 'warning', 520);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('bf312d30-99dd-11e3-9a36-2b027935a066', 'ba_unit-has-cadastre-object', 'ba_unit', NULL, NULL, 'current', NULL, NULL, 'medium', 500);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('bf37e40e-99dd-11e3-bf28-2f86e5fe7685', 'ba_unit-has-a-valid-primary-right', 'ba_unit', NULL, NULL, 'current', NULL, NULL, 'critical', 20);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('bf86a170-99dd-11e3-a2a8-bf0f7b339519', 'rrr-must-have-parties', 'rrr', NULL, NULL, 'current', NULL, NULL, 'critical', 110);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('bf88010a-99dd-11e3-acc8-9783e3e19a06', 'rrr-shares-total-check', 'rrr', NULL, NULL, 'current', NULL, NULL, 'critical', 40);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('bfad3cd6-99dd-11e3-ad94-575ceec4b27e', 'bulk-spatial-geom-overlaps-with-loading-geom', 'bulkOperationSpatial', NULL, NULL, 'pending', NULL, NULL, 'warning', 440);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('bfafade0-99dd-11e3-8c7f-9f27f35049a0', 'bulk-spatial-geom-overlaps-with-existing', 'bulkOperationSpatial', NULL, NULL, 'pending', NULL, NULL, 'warning', 440);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('bfb09840-99dd-11e3-b41f-5b4e49782eaf', 'bulk-spatial-geom-not-valid', 'bulkOperationSpatial', NULL, NULL, 'pending', NULL, NULL, 'warning', 440);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('bfb182a0-99dd-11e3-bffe-dfa75b679d35', 'bulk-spatial-name-unique', 'bulkOperationSpatial', NULL, NULL, 'pending', NULL, NULL, 'warning', 440);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('bfeae2fc-99dd-11e3-98d3-47256ea2b59e', 'consolidation-db-structure-the-same', 'consolidation', NULL, NULL, NULL, NULL, NULL, 'critical', 570);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('16502d1a-866d-11e4-bfb0-9b93276da727', 'cadastre-object-check-name', 'state_land', NULL, NULL, 'pending', NULL, NULL, 'medium', 665);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('165dc1dc-866d-11e4-8160-d372d9ca6067', 'cadastre-object-check-name', 'state_land', NULL, NULL, 'current', NULL, NULL, 'medium', 605);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('166b087e-866d-11e4-8186-c78d5cfea033', 'area-check-percentage-newofficialarea-calculatednewarea', 'state_land', NULL, NULL, 'pending', NULL, NULL, 'warning', 620);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('166ba4c8-866d-11e4-90fb-03ed68625ee1', 'area-check-percentage-newofficialarea-calculatednewarea', 'state_land', NULL, NULL, 'current', NULL, NULL, 'warning', 610);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('166c19f8-866d-11e4-87f7-ef8d56e83c6b', 'new-cadastre-objects-do-not-overlap', 'state_land', NULL, NULL, 'pending', NULL, NULL, 'warning', 60);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('166cb638-866d-11e4-b1e2-4b8f04fcf9b7', 'new-cadastre-objects-do-not-overlap', 'state_land', NULL, NULL, 'current', NULL, NULL, 'medium', 480);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('166dc7a8-866d-11e4-a0f3-4f8913b29b1d', 'application-br7-check-sources-have-documents', 'application', 'validate', NULL, NULL, NULL, NULL, 'warning', 570);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('167a991a-866d-11e4-940d-9b6d584712c7', 'ba-unit-has-spatial-parcels', 'ba_unit', NULL, NULL, 'current', NULL, NULL, 'medium', 800);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('167b8384-866d-11e4-833e-cf05313ff73d', 'ba-unit-has-notes-to-action', 'ba_unit', NULL, NULL, 'current', NULL, NULL, 'warning', 810);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('167c46d4-866d-11e4-95cf-b71fbf14437b', 'parcel-name-duplicated', 'state_land', NULL, NULL, 'pending', NULL, NULL, 'critical', 668);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('167ce314-866d-11e4-a6c0-d369aa5653b6', 'parcel-name-duplicated', 'state_land', NULL, NULL, 'current', NULL, NULL, 'critical', 608);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('167da664-866d-11e4-b887-bb9f0db3e8aa', 'property-compenstation-comparison', 'service', NULL, 'complete', NULL, 'slNegotiate', NULL, 'medium', 830);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('167edeee-866d-11e4-8833-ebabf55bbd09', 'ba-unit-has-land-use', 'ba_unit', NULL, NULL, 'current', NULL, NULL, 'warning', 840);
INSERT INTO br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('167f541e-866d-11e4-8510-fb93d589f1d2', 'rrr-has-conditions', 'rrr', NULL, NULL, 'current', NULL, NULL, 'warning', 840);


ALTER TABLE br_validation ENABLE TRIGGER ALL;

--
-- PostgreSQL database dump complete
--

