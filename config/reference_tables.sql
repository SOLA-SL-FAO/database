--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = administrative, pg_catalog;

--
-- Data for Name: ba_unit_rel_type; Type: TABLE DATA; Schema: administrative; Owner: postgres
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE ba_unit_rel_type DISABLE TRIGGER ALL;

INSERT INTO ba_unit_rel_type (code, display_value, description, status) VALUES ('underlyingTitle', 'Underlying Title::::::::::::::::የሥረ-መሠረት የይዞታ መብት ማረጋገጫ ሰነድ', 'The title from which the state land was taken.::::::::::::::::የመንግሥት መሬት ተቆርሶ ተወስዶበት የነበረ የይዞታ መብት', 'c');
INSERT INTO ba_unit_rel_type (code, display_value, description, status) VALUES ('settlement', 'Settlement::::::::::::::::ስምምነት/ሰፈራ', 'The property is within a settlement or village.::::::::::::::::ንብረቱ የሚገኘው ሰው የሰፈረበት ቦታ ውስጥ ነው', 'c');
INSERT INTO ba_unit_rel_type (code, display_value, description, status) VALUES ('rootTitle', 'Root of Title::::Корневая недвижимость::::أصل  سند الملكية::::Racine du Titre::::የባለሀብትነት ሰነዱ ሥረ-መሠረት', 'Root of Title::::Корневая недвижимость::::...::::Racine du Titre::::የባለሀብትነት ሰነዱ ሥረ-መሠረት', 'x');
INSERT INTO ba_unit_rel_type (code, display_value, description, status) VALUES ('priorTitle', 'Prior Title::::Предыдущая недвижимость::::سند الملكية السابق::::Titre précédent::::የቀደመ የይዞታ መብት ማረጋገጫ ሰነድ', 'Prior Title::::Предыдущая недвижимость::::...::::Titre précédent::::የቀደመ የይዞታ መብት ማረጋገጫ ሰነድ', 'x');
INSERT INTO ba_unit_rel_type (code, display_value, description, status) VALUES ('island', 'Island::::::::::::::::ደሴት', 'The property is within an island.::::::::::::::::ንብረቱ የሚገኘው ደሴት ውስጥ ነው', 'c');
INSERT INTO ba_unit_rel_type (code, display_value, description, status) VALUES ('claimed', 'Claimed Land::::::::::::::::የመብት ጥያቄ የቀረበበት መሬት', 'The property is on an area of reclaimed land.::::::::::::::::ንብረቱ የሚገኘው መልሶ እንዲያገግም የተደረገ መሬት ላይ ነው', 'c');


ALTER TABLE ba_unit_rel_type ENABLE TRIGGER ALL;

--
-- Data for Name: ba_unit_type; Type: TABLE DATA; Schema: administrative; Owner: postgres
--

ALTER TABLE ba_unit_type DISABLE TRIGGER ALL;

INSERT INTO ba_unit_type (code, display_value, description, status) VALUES ('stateLand', 'State Land::::::::::::::::የመንግስት መሬት ', 'State land property type::::::::::::::::በመንግስት መሬት ላይ ያለ ንብረት ዓይነት', 'c');
INSERT INTO ba_unit_type (code, display_value, description, status) VALUES ('basicPropertyUnit', 'Property::::::::::::::::ንብረት ', 'This is the basic property unit that is used by default::::Это базовая единица недвижимости используемая по умолчанию::::...::::Ceci est l''unité de base de propriété utilisée par défaut::::ይህ በሌላ አስካልተቀየረ ድረስ በቋሚነት የሚሰራ መሠረታዊ የንብረት ክፍል ነው', 'c');
INSERT INTO ba_unit_type (code, display_value, description, status) VALUES ('administrativeUnit', 'Administrative Unit::::Административная единица::::وحدة ادارية::::Unité Administrative::::የአስተዳደር አካል', '...::::::::...::::...::::...', 'x');
INSERT INTO ba_unit_type (code, display_value, description, status) VALUES ('leasedUnit', 'Leased Unit::::Единица для Аренды::::وحدة  مؤجرة::::Unité de Bail::::የተከራየ ክፍል', '...::::::::...::::...::::...', 'x');
INSERT INTO ba_unit_type (code, display_value, description, status) VALUES ('propertyRightUnit', 'Property Right Unit::::Единица права недвижимости::::وحدة حقوق الملكية::::Unité de Droit de Propriété::::የንብረት መብት አሀድ', '...::::::::...::::...::::...', 'x');


ALTER TABLE ba_unit_type ENABLE TRIGGER ALL;

--
-- Data for Name: condition_type; Type: TABLE DATA; Schema: administrative; Owner: postgres
--

ALTER TABLE condition_type DISABLE TRIGGER ALL;

INSERT INTO condition_type (code, display_value, description, status) VALUES ('c4', '4. Use of Land::::::::::::::::4 የመሬት ጥቅም', 'The Lessee shall use the land comprised in the lease only for the purpose specified in the lease or in any variation made to the original lease.::::The Lessee shall use the land comprised in the lease only for the purpose specified in the lease or in any variation made to the original lease.::::على المستاجر استخدام الارض فقط للاغراض المنصوص عليها في عقد الايجار او أي تغييرات مرفقة مع عقد الايجار::::Le preneur de bail doit utiliser le terrain compris dans le bail seulement pour l''objet spécifié dans bail ou dans une variation effectuée au bail d''origine.::::ተከራዩ መሬቱን በሊዝ ውሉ ላይ ወይም በማሻሻያው ለተጠቀሰው ተግባር ብቻ መጠቀም ይኖርበታል', 'c');
INSERT INTO condition_type (code, display_value, description, status) VALUES ('c6', '6. Building Repair and Maintenance::::::::::::::::6 የሕንፃ ጥገና እና እድሳት', 'The interior and exterior of any building erected on the land and all building additions thereto and all other buildings at any time erected or standing on the land and walls, drains and other appurtenances, shall be kept by the Lessee in good repair and tenantable condition to the satisfaction of the planning authority.::::The interior and exterior of any building erected on the land and all building additions thereto and all other buildings at any time erected or standing on the land and walls, drains and other appurtenances, shall be kept by the Lessee in good repair and tenantable condition to the satisfaction of the planning authority.::::جميع مداخل ومخارج البنايات المرفوعة على الارض وجميع البنايات المرفوعة على الارض في أي وقت والجدران والمصارف والتوابع , يجب الحفاظ عليها بصورة جيدة وتصليحها بما يحقق متطلبات سلطة التخطيط::::Les intérieurs et extérieurs des bâtiments érigés sur le terrain and tous les ajouts et autres bâtiments érigés à n''importe quel moment ou en cours de réalisation, ainsi que les murs, drains ou autres équipements, doivent être entretenus par le teneur de bail en bon état de location à la satisfaction des autorités d''urbanisme.::::ተከራዩ በመሬቱ ላይ የተገነባው ሕንጻዎች፤ የሕንጻ ማስፋፊያዎች፤ ውስጣዊና ውጫዊ ክፍሎች ግድግዳዎች የሌሎች ተጨማሪ ነገሮች፤ ሁኔታዎች የሚመለከተው አካል በሚያወጣው መስፈርት መሰረት በጥሩ ሁኔታና ሊከራዩ በሚችሉበት ደረጃ መጠበቅ አለበት ', 'c');
INSERT INTO condition_type (code, display_value, description, status) VALUES ('c7', '7. Removal of Contaminants::::::::::::::::7 በካዮችን ማስወገድ', 'Any contaminants idenitified by the planning authority are to be removed and the land restored to is original state within 12 months from the begining of the lease.::::::::::::::::በፕላን ባለስልጣኑ የተለዩት በካይ ነገሮች ሊዙ በተጀመረ በአስራ ሁለት ወራት ውስጥ ይወገዳሉ፤ መሬቱም ቀድሞ ወደ ነበረበት ቦታ ይመለሳል', 'c');
INSERT INTO condition_type (code, display_value, description, status) VALUES ('c2', '2. Development of Land::::::::::::::::2 የመሬት ማልማት', 'Unless special written authority is given by the Commissioner, the Lessee shall commence development of the land within 5 years of the date of the granting of a lease. This shall also apply to further development of the land held under a lease during the term of the lease.::::Unless special written authority is given by the Commissioner, the Lessee shall commence development of the land within 5 years of the date of the granting of a lease. This shall also apply to further development of the land held under a lease during the term of the lease.::::ما لم يصدر مرسوم رسمي عن المفوض , على المستأجر البدء يتطوير الارض خلال 5 سنوات من تاريخ  الاستئجار. كما ينطبق ذلك على التطوير الاضافي للارض الواقعى ضمن بنود الاستئجار::::A moins que le Commissaire de donne des pouvoirs spéciaux par écrit, le preneur de bail doit commencer le développement du terrain dans les 5 ans suivant la date d''obtention du bail. Ceci doit aussi s''appliquer à d''autres développement du terrain tenu à bail pendant la durée du bail.::::ኮሚሽነሩ ልዩ መብት በጽሁፍ እስካልሰጡት ድረስ የመሬት ተከራይ ከተፈቀደለት ቀን አንስቶ በአምስት ዓመታት ውስጥ መሬቱን ማልማት መጀመር ይኖርበታል፤ ይህ በሊዝ የተያዘ መሬት ላይ ሊዙ ጸንቶ ባለበት ጊዜ ውስጥ መሬቱ ላይ ተጨማሪ ልማት በሚካሄድበት ሁኔታም ተግባራዊ ይሆናል', 'c');
INSERT INTO condition_type (code, display_value, description, status) VALUES ('c5', '5. Planning Authority Access::::::::::::::::5 የፕላን ባለስልጣን ተደራሽነት', 'Save with the written authority of the planning authority, no electrical power or telephone pole or line or water, drainage or sewer pipe being upon or passing through, over or under the land and no replacement thereof, shall be moved or in any way be interfered with and reasonable access thereto shall be preserved to allow for inspection, maintenance, repair, renewal and replacement.::::Save with the written authority of the planning authority, no electrical power or telephone pole or line or water, drainage or sewer pipe being upon or passing through, over or under the land and no replacement thereof, shall be moved or in any way be interfered with and reasonable access thereto shall be preserved to allow for inspection, maintenance, repair, renewal and replacement.::::محفوظة بشكل خطي عند سلطة التخطيط , جميع خطوط الطاقة الكهربائية أو قطب الهاتف أو خط المياه والصرف الصحي أو أنابيب المجاري التي تجري على الارض او و تمر، فوق أو تحت الأرض لا يجب استبدال أي منها، او نقلها في أي حال من الأحوال ويجب الحفاظ عليها وضمان صول معقول للسماح للتفتيش والصيانة والإصلاح والتجديد والاستبدال::::Sauvegarder en écrit de la part des autorités de l''urbanisme, pas de courant électrique ou de poteau de téléphone ou d''évacuation d''égout passant au-dessus ou à travers, au-dessus ou en-dessous du terrain et pas de remplacement, ne doit pas être déplacé ou interférer avec l''accès, doit être préservé pour rendre possible l''inspection, l''entretien, la réparation, le renouvellement ou le déplacement.::::የሚመለከተው ባለስልጣን ካላዘዘ በስተቀር፤ ማንኛቸውም ከመሬት ላይ ወይም በታች የሚያልፍ የኤሌክትሪክ ወይም የስልክ ምሰሶ ወይም መስመር ወይም የውኃ መስመር፤ የፍሳሽ ወይም የፍሳሽ ቆሻሻ ቱቦ እንዲሁም እነዚህን መትከል ከቦታቸው ማንሳት ወይም በማናቸውም ሌላ መንገድ ሁከት መፍጠር ክልክል ነው፡፡ እናም እነዚህን ለመቆጣጠር፤ ለመጠገን፤ ለማደስ እና ለመቀየር የሚያስችል ምክንያታዊ ተደራሽነት ሊኖር ይገባል ', 'c');
INSERT INTO condition_type (code, display_value, description, status) VALUES ('c3', '3. Drainage and Sewerage::::::::::::::::3 ውኃ መውረጃ እና የፍሳሽ ቆሻሻ ማስተላለፊያ', 'Within a period of the time to be fixed by the planning authority, the Lessee shall provide at his own expense main drainage or main sewerage connections from the building erected on the land as the planning authority may require.::::Within a period of the time to be fixed by the planning authority, the Lessee shall provide at his own expense main drainage or main sewerage connections from the building erected on the land as the planning authority may require.::::ضمن المدة المحددة من سلطة التخطيط, على المستأجر التمديد على حسابه وصلات الصرف الصحي وصرف المياه من البناية المرفوعة على الارض بما يتوافق مع متطلبات سلطة التخطيط::::Pendant la période de temps fixée par les autorités en charge de l''urbanisme, le preneur de bail doit fournir à ses propres frais une évacuation des eaux usées ou un raccordement au réseau d''évacuation des beaux usées depuis le bâtiment érigé sur le terrain selon les conditions des autorités en charge de l''urbanisme.::::የሚመለከተው የፕላን ባለስልጣን በሚወስነው ጊዜ ውስጥና እና በሚጠይቀው መሠረት  ተከራዩ በራሱ ወጪ ከሕንጻው ጋር የውሃ መውረጃና የፍሳሽ ቆሻሻ ማስተላለፊያ ቱቦ ማያያዝ ይኖርበታል', 'c');
INSERT INTO condition_type (code, display_value, description, status) VALUES ('c1', '1. Fence Boundaries::::::::::::::::1 የአጥር ወሰኖች', 'Unless the Minister directs otherwise the Lessee shall fence the boundaries of the land within 6 (six) months of the date of the grant and the Lessee shall maintain the fence to the satisfaction of the Commissioner.::::Unless the Minister directs otherwise the Lessee shall fence the boundaries of the land within 6 (six) months of the date of the grant and the Lessee shall maintain the fence to the satisfaction of the Commissioner.::::ما لم يقرر الوزير غير ذلك  على المستأجر تسسيج حدود الارض بمدة لا تزيد عن 6 شهورمن تاريخ السماح ويجب على المستاجر المحافظة على سلامة السياج لصالح المفوض::::A moins que le Ministre n''ordonne d''autres directives, le preneur de bail doit clôturer les limites du terrain dans les 6 (six) mois suivant la date d''obtention du bail et le preneur de bail doit entretenir la clôture selon la satisfaction du Commissaire.::::ሚኒስትሩ ተለዋጭ ትዕዛዝ እስካልሰጡ ድረስ ተከራዩ መሬቱ ከተሰጠበት ቀን ጀምሮ በስድስት ወራት ውስጥ የመሬቱ ዳር ድንበር (ወሰኖች) ማጠር አለበት፤ እንዲሁም ተከራዩ አጥሩን ኮሚሽነሩ በሚያወጣው መስፈርት መሰረት መጠገን ይኖርበታል', 'c');


ALTER TABLE condition_type ENABLE TRIGGER ALL;

--
-- Data for Name: mortgage_type; Type: TABLE DATA; Schema: administrative; Owner: postgres
--

ALTER TABLE mortgage_type DISABLE TRIGGER ALL;

INSERT INTO mortgage_type (code, display_value, description, status) VALUES ('levelPayment', 'Level Payment::::Многоуровневый платеж::::دفعات متدرجة::::Niveau de Paiement::::ደረጃ ያለው ክፍያ', '...::::::::...::::...::::...', 'c');
INSERT INTO mortgage_type (code, display_value, description, status) VALUES ('linear', 'Linear::::Линейный::::خطي::::Linéaire::::ለሕዝብ አስተዳደር', '...::::::::...::::...::::...', 'c');
INSERT INTO mortgage_type (code, display_value, description, status) VALUES ('microCredit', 'Micro Credit::::Микро кредит::::القروض الصغيرة::::Micro Crédit::::አነስተኛ ብድር', '...::::::::...::::...::::...', 'c');


ALTER TABLE mortgage_type ENABLE TRIGGER ALL;

--
-- Data for Name: notation_status_type; Type: TABLE DATA; Schema: administrative; Owner: postgres
--

ALTER TABLE notation_status_type DISABLE TRIGGER ALL;

INSERT INTO notation_status_type (code, display_value, description, status) VALUES ('completed', 'Action Completed', 'All activities or actions for the notation have been completed.', 'c');
INSERT INTO notation_status_type (code, display_value, description, status) VALUES ('actionReqd', 'Action Required', 'Some activity or action is required in relation to the property.', 'c');
INSERT INTO notation_status_type (code, display_value, description, status) VALUES ('onHold', 'On Hold', 'No action or activity is required in relation to the notation for the timebeing.', 'c');
INSERT INTO notation_status_type (code, display_value, description, status) VALUES ('actionReqdUrgent', 'Urgent Action Required', 'Urgent activities or actions are required in relation to the property.', 'c');
INSERT INTO notation_status_type (code, display_value, description, status) VALUES ('general', 'General', 'The notation is a general note and no activity or action is necessary.', 'c');
INSERT INTO notation_status_type (code, display_value, description, status) VALUES ('pending', 'Pending', 'Included to support generic SOLA functionality. Status set to x so this value is not displayed to the user for selection.', 'x');


ALTER TABLE notation_status_type ENABLE TRIGGER ALL;

--
-- Data for Name: rrr_group_type; Type: TABLE DATA; Schema: administrative; Owner: postgres
--

ALTER TABLE rrr_group_type DISABLE TRIGGER ALL;

INSERT INTO rrr_group_type (code, display_value, description, status) VALUES ('responsibilities', 'Responsibilities::::Ответственность::::المسؤوليات::::Responsabilités::::ኃላፊነቶች', '...::::::::...::::...::::...', 'x');
INSERT INTO rrr_group_type (code, display_value, description, status) VALUES ('restrictions', 'Restrictions::::Ограничения::::القيود::::Restrictions::::ገደቦች', '...::::::::...::::...::::...', 'c');
INSERT INTO rrr_group_type (code, display_value, description, status) VALUES ('rights', 'Rights::::Права::::الحقوق::::Droits::::መብቶች', '...::::::::...::::...::::...', 'c');


ALTER TABLE rrr_group_type ENABLE TRIGGER ALL;

--
-- Data for Name: rrr_type; Type: TABLE DATA; Schema: administrative; Owner: postgres
--

ALTER TABLE rrr_type DISABLE TRIGGER ALL;

INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('commonOwnership', 'rights', 'Common Ownership::::Общая собственность::::الملكية العامة::::Propriété Commune::::የጋራ ባለሀብትነት', false, true, true, '...::::::::...::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('waterrights', 'rights', 'Water Right::::Право на водные ресурсы::::حق في المياه::::Droit d''Eau::::የውሃ መብት', false, true, true, '...::::::::...::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('fishing', 'rights', 'Fishing Right::::Рыболовное право::::حق الصيد::::Droit de pêche::::አሳ የማስገር መብት', false, true, true, '...::::::::...::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('customaryType', 'rights', 'Customary Right::::Традиционное право::::الحق العرفي::::Droit Coutumier::::ልማዳዊ መብት', false, true, true, '...::::::::...::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('agriActivity', 'rights', 'Agriculture Activity::::Сельскохозяйственная деятельность::::نشاط زراعي::::Activité Agricole::::የግብርና እንቅስቃሴ', false, true, true, '...::::::::...::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('usufruct', 'rights', 'Usufruct::::Право использования для сбора урожая::::حق الانتفاع::::Usufruit::::አላባ', false, true, true, '...::::::::...::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('ownership', 'rights', 'Owner::::::::::::::::ባለሀብት', true, true, true, 'The owner of a property.::::::::::::::::የንብረቱ ባለሀብት', 'c', 'ownership');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('informalOccupation', 'rights', 'Informal Occupation::::Неформальная оккупация::::الاستعمال الغير رسمي::::Occupation informelle::::ይፋዊ ያልሆነ ይዞታ', false, false, false, '...::::::::...::::...::::...', 'x', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('grazing', 'rights', 'Grazing Right::::Право выпаса::::حق الرعي::::Droit de Pacage::::የግጦሽ መብት', false, true, true, '...::::::::...::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('monument', 'restrictions', 'Monument::::Памятник::::النصب::::Monument::::ሐውልት ', false, true, true, '...::::::::...::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('monumentMaintenance', 'responsibilities', 'Monument Maintenance::::Обслуживание памятника::::صيانة النصب::::Entretien Monument::::ሐውልት ጥገና', false, false, false, '...::::::::...::::...::::...', 'x', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('caveat', 'restrictions', 'Caveat::::Арест::::القيود::::Caveat::::የእክል ማስጠንቀቂያ', false, true, true, 'Extension to LADM::::Расширение LADM::::...::::Extension du LADM::::ወደ መአዶሞ ማስፋት', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('landbank', 'restrictions', 'Landbank::::::::::::::::የመሬት ባንክ', false, false, false, 'Indicates the land is part of a landbank and is likely to be disposed of at some point.::::::::::::::::መሬቱ የመሬት ባንክ አካል መሆኑን እና ከተወሰነ ጊዜ በኋላ ሊተላለፍ እንደሚችል ያመለክታል ', 'c', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('superficies', 'rights', 'Superficies::::Superficies::::بناء متعدي::::Superficies::::ውጫዊ ገጽታ', false, true, true, '...::::::::...::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('lease', 'rights', 'Lease::::Аренда::::الايجار::::Bail::::ሊዝ', false, false, true, 'Lease of property possibly subject to conditions.::::::::::::::::ገደብ ያለበት ንብረት ማከራየት', 'c', 'lease');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('liability', 'responsibilities', 'Liability::::::::::::::::ኃላፊነት', false, false, false, 'Indicates the land is subject to some form of liability such as contamination, erosision or instability.::::::::::::::::መሬቱ እንደ ብክለት፤ መሸርሽር ወይም ያለመጽናት ያሉ እክሎች ተጋላጭ መሆኑን ያመለክታል', 'c', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('license', 'rights', 'License::::::::::::::::ፈቃድ', false, false, true, 'Indicates that a license, usually for a specific purpose such has mining, grazing, forestry, etc, has been granted.::::::::::::::::እንደ ማእድን ማውጫ፤ ግጦሽና ደን ወዘተ ያለ ለልዩ አላማ የተሰጠ ፈቃድ ያመለክታል', 'c', 'lease');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('ownershipAssumed', 'rights', 'Ownership Assumed::::Принятое право собственности::::افتراض الملكية::::Propriété supposée::::የባለሃብትነት ግምት ይወስዳል', true, true, true, '...::::::::...::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('tenancy', 'rights', 'Tenancy::::Арендаторство::::استئجار عقار::::Tenure::::ኪራይ', true, true, true, '...::::::::...::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('noBuilding', 'restrictions', 'Building Restriction::::Ограничение на здание::::قيود على بناية::::Restriction Bâtiment::::የሕንጻ ገደብ', false, false, false, '...::::::::...::::...::::...', 'x', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('firewood', 'rights', 'Firewood Collection::::Сбор древисины::::...::::Collecte Bois à brûler::::ማገዶ ለቀማ', false, true, true, '...::::::::...::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('lifeEstate', 'rights', 'Life Estate::::Пожизненное право собственности::::عقار مدى الحياة::::Donation au dernier vivant::::Life Estate', true, true, true, 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('limitedAccess', 'restrictions', 'Limited Access (to Road)::::Ограниченный доступ к дороге::::استعمال محدود للطريق::::Accès Limité (à la Route)::::ቀጥተኛ (ሊንየር)', false, false, false, 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት', 'x', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('condition', 'responsibilities', 'Condition::::::::::::::::ሁኔታ', false, false, false, 'Indicates that conditions have been imposed on the states ownership of the land (e.g. specific disposal conditions, etc).::::::::::::::::በመንግስት ባለሃብትነት በተያዘው መሬት ላይ የተጣሉ ገደቦች (ለምሳሌ የተለየ የማስተላለፍ ገደቦች ወዘተ) ያመለክታል ', 'c', 'simpleRightCondPanel');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('claim', 'restrictions', 'Claim::::::::::::::::የመብት ጥያቄ', false, false, true, 'Indicates an individual or group has a claim over the property.::::::::::::::::ግለሰብ ወይም ስብስብ በንብረቱ ላይ የመብት ጥያቄ እንዳለው ያመለክታል', 'c', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('apartment', 'rights', 'Apartment Ownership::::Право собственности на квартиру::::مالك الشقة::::Propriété d''Appartement::::የአፓርታማ ባለሀብትነት', true, true, true, 'Extension to LADM::::Расширение LADM::::...::::...::::ወደ መአዶሞ ማስፋት', 'x', 'ownership');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('mortgage', 'restrictions', 'Mortgage::::Ипотека::::الرهن::::Hypothèque::::ዋስትና', false, true, true, '...::::::::...::::...::::...', 'x', 'mortgage');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('stateOwnership', 'rights', 'State Landholder::::::::::::::::የመንግስት መሬት ባለይዞታ', true, false, true, 'State agency or other state organisation that has the primary responsiblity for managing and using the land.::::::::::::::::መሬትን ለማስተዳደር እና ለመጠቀም ዋና ኃላፊነት ያለበት የመንግስት ኤጀንሲ ወይም ሌላ የመንግስት ተቋም', 'c', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('servitude', 'restrictions', 'Easement::::::::::::::::የንብረት አገልግሎት', false, false, false, 'An easement over a property for general access, roading, water or power transmission.::::::::::::::::ለአጠቃላይ መተላለፊያ መንገድ፤ ውኃ ወይም ኃይል ማስተላለፊያ የሚሆን አንድ ንብረት ላይ ያለ የንብረት አገልግሎት', 'c', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('ppp', 'rights', 'Public Private Partnership::::::::::::::::የመንግስት እና የግል ትብብር', false, false, true, 'Indicates that the state has entered into a public private partnership along with any coniditions relating to that partnership.::::::::::::::::መንግስት ከግሉ ዘርፍ ጋር ትብብር ማድረጉንና የዚህኑ ትብብር ገደቦች ያመለክታል', 'c', 'simpleRholdConPanel');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('restriction', 'restrictions', 'Restriction::::::::::::::::ገደብ', false, false, false, 'Restriction imposed on the property usually by local government bodies such as building and/or water taking restrictions.::::::::::::::::በንብረት ላይ የተጣለ ገደብ በተለይም በተለምዶ በአካባቢ የመንግሥት አስተዳደር አካላት እንደ የሕንፃ እና/ወይም ውኃ የመጠቀም ገደቦች', 'c', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('heritage', 'responsibilities', 'Heritage::::::::::::::::ቅርስ', false, false, false, 'Indicates the land contains a heritage site that has historical, cultural, archaelogical or natural/environmental significance.::::::::::::::::መሬቱ እንደ ታሪካዊ፤ ባሕላዊ፤ አርኪኦለጂያዊ ወይም ተፈጥሯዊ/ አካባቢያዊ ጠቀሜታ ያለው የቅርስ ቦታ የያዘ መሆኑን ያመለክታል', 'c', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('historicPreservation', 'restrictions', 'Historic Preservation::::Историческая резервация::::الحفظ التاريخي::::Préservation Historique::::ታሪካዊ ጥበቃ', false, false, false, 'Extension to LADM::::Расширение LADM::::...::::...::::ወደ መአዶሞ ማስፋት', 'x', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('notice', 'restrictions', 'Notice::::::::::::::::ማስታወቂያ', false, false, false, 'Public or legal notices that have been issued in relation to the property such as noticies for trespass, littering or rubbish dumping, etc.::::::::::::::::ከንብረት በተያያዘ እንደ ሁከት መፍጠር፤ ማቆሸሽ፤ ወይም ቆሻሻ ያለቦታው መድፋት ወዘተ የተመለከቱ የሕዝብ ወይም የሕግ ማስታወቂያዎች ተለቀዋል', 'c', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('adminPublicServitude', 'restrictions', 'Administrative Public Servitude::::Административный публичный сервитут::::حق الاستخدام العام::::Servitude Publique Administrative::::አስተዳደራዊ የሕዝብ ንብረት አገልግሎት', false, true, true, '...::::::::...::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('rsensitivity', 'restrictions', 'Reverse Sensitivity::::::::::::::::አዲስ የተቋቋሙ መብቶች ነባር መብቶች ላይ ገደብ እንዳይጥሉ መከላከል ', false, false, false, 'Indicates that in a mixed use area, once a particular use for land is established (e.g. road or highway), any new uses for surronding property (e.g. residential development) cannot impose restrictions on the established use.::::::::::::::::ለቅይጥ ጥቅም የዋለ አካባቢ አንድ መሬት ለተወሰነ ጥቅም(ምሳሌ መንገድ ወይም አውራ ጎዳና) እንዲውል ከተደረገ በአካባቢው ያሉ ሌሎች ንብረቶች የሚሰጡት አዲስ ጥቅሞች (ምሳሌ የመኖሪያ አካባቢ ልማት) በተወሰነው ጥቅም ላይ ገደቦች ሊጥሉ አይችሉም', 'c', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('occupation', 'rights', 'Occupation::::Оккупация::::الاستعمال::::Occupation::::ይዞታ', false, false, true, 'General occupation of land by an individual or group that may be informal, traditional or illegal.::::::::::::::::ጠቅላላ በግለሰብ ወይም በስብስብ ይፋዊ፤ ልማዳዊ ወይም ሕገ-ወጥ ሊሆን በሚችል መንገድ የተያዘ መሬት', 'c', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('customary', 'rights', 'Customary::::::::::::::::ልማዳዊ', false, false, true, 'Indicates the land is subject to customary title and related activities such as food gathering. ::::::::::::::::መሬቱ የልማዳዊ መብት እና እንደ ምግብ ለቀማና ተያያዥ እንቅስቃሴዎች ያለበት መሆንን ያመለክታል', 'c', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('order', 'restrictions', 'Order::::::::::::::::ትዕዛዝ', false, false, false, 'An order issued by the court or a decision from a tribunal or other judicial authority that imposes a specific action on the property (e.g. transfer from one owner to another or a demolition order, etc.::::::::::::::::በንብረት ላይ የተለየ ገደብ (ምሣሌ ከአንዱ ባለሀብት ወደ ሌላው ማስተላለፍን ወይም የማፍረስ ትእዛዝ ወዘተ) የፍርድ ቤት ትዕዛዝ ወይም የአስተዳደር ፍርድ ቤት ወይም የሌላ የፍትሕ አካል ውሳኔ ', 'c', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('waterwayMaintenance', 'responsibilities', 'Waterway Maintenance::::Обслуживания каналов ирригации::::صيانة الممر المائي::::Entretien Voie Navigable::::የሰርጽ ጥገና', false, false, false, '...::::::::...::::...::::...', 'x', 'simpleRight');


ALTER TABLE rrr_type ENABLE TRIGGER ALL;

--
-- Data for Name: rrr_sub_type; Type: TABLE DATA; Schema: administrative; Owner: postgres
--

ALTER TABLE rrr_sub_type DISABLE TRIGGER ALL;

INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('mining', 'Mining', 'The license applies to mining activities.', 'c', 'license');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('fishing', 'Fishing', 'The license applies to fishing activities.', 'c', 'license');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('exploration', 'Exploration', 'The license applies to resource exploration activities.', 'c', 'license');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('forestry', 'Forestry', 'The license applies to forestry activities.', 'c', 'license');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('aquaculture', 'Aquaculture', 'The license applies to aquaculture such as fish and shellfish farming activities.', 'c', 'license');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('pastoral', 'Pastoral Occupation', 'The license applies to pastoral occupation.', 'c', 'license');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('contamination', 'Contamination', 'The liability is for contamination of the land.', 'c', 'liability');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('erosion', 'Erosion', 'The liability is for erosion of the land.', 'c', 'liability');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('instability', 'Instabiltiy', 'The liability is related to instability of the land. e.g. Red Zone land', 'c', 'liability');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('building', 'Building Restriction', 'The restriction relates to buildings on the property.', 'c', 'restriction');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('water', 'Water Restriction', 'The restriction relates to taking of water from the property.', 'c', 'restriction');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('cultural', 'Cultural', 'The land has a cultural heritage site located on it.', 'c', 'heritage');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('archeological', 'Archeological', 'The land has an archeological heritage site located on it.', 'c', 'heritage');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('historic', 'Historic', 'The land has an historical heritage site loctaed on it.', 'c', 'heritage');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('nature', 'Natural', 'The land has a natural site of significance loctaed on it.', 'c', 'heritage');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('rightOfWay', 'Right of Way', 'The easement is for a Right of Way.', 'c', 'servitude');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('utility', 'Utility Transmission', 'The easement is for the transmission of utilities across the property.', 'c', 'servitude');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('accessway', 'Accessway', 'The easement is for a public accessway across the property.', 'c', 'servitude');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('food', 'Food Gathering', 'The customary right is for food gathering.', 'c', 'customary');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('noise', 'Noise Level', 'The reverse sensitivity relates to the noise level (e.g. motorway noise) eminating from the property.', 'c', 'rsensitivity');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('disposal', 'Disposal', 'The conditions relate to disposal of the property.', 'c', 'condition');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('structure', 'Structure', 'The land has a heritage building or structure site located on it.', 'c', 'heritage');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('recreation', 'Recreation', 'The license applies to use of the land for recreational purposes such as a ski field.', 'c', 'license');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('bank1', 'Oneroa Settlement', 'Land allocated for housing in and around the settlement of Oneroa.', 'c', 'landbank');
INSERT INTO rrr_sub_type (code, display_value, description, status, rrr_type_code) VALUES ('bank2', 'Hooks Bay', 'Land allocated for farming in and around the Hooks Bay.', 'c', 'landbank');


ALTER TABLE rrr_sub_type ENABLE TRIGGER ALL;

--
-- Data for Name: valuation_type; Type: TABLE DATA; Schema: administrative; Owner: postgres
--

ALTER TABLE valuation_type DISABLE TRIGGER ALL;

INSERT INTO valuation_type (code, display_value, description, status) VALUES ('valueInUse', 'Value In Use::::::::::::::::አንድን ንብረት ከመጠቀም የሚገኝ ምጣኔያዊ ጥቅም', 'Represents the cash flow generated for a specific owner under a specific use.::::::::::::::::አንድ ባለሀብት ንብረቱን በተወሰነ መልኩ ጥቅም ላይ በማዋሉ የተገኘ የገንዘብ ፍሰትን ይወክላል', 'c');
INSERT INTO valuation_type (code, display_value, description, status) VALUES ('mass', 'Mass::::::::::::::::ጅምላ', 'Property value has been determined through a mass valuation process::::::::::::::::የንብረት ዋጋ የተወሰነው በጅምላ ግመታ ሂደት ነው', 'c');
INSERT INTO valuation_type (code, display_value, description, status) VALUES ('market', 'Market::::::::::::::::ገበያ', 'The value the property will likely trade for between a willing buyer and willing seller as at the valuation date.::::::::::::::::ግምት በተወሰደበት ቀን በፈቃደኛ ገዥ እና ሻጭ መካከል ንብረቱ የሚሸጥበት ዋጋ', 'c');
INSERT INTO valuation_type (code, display_value, description, status) VALUES ('liquidation', 'Liquidation Value::::::::::::::::የማጣሪያ ዋጋ', 'Property value where the owner is compelled to sell due to bankruptcy or forced sale.::::::::::::::::ባለንብረቱ በኪሳራ ምክንያት ለመሸጥ ሲገደድ የሚኖረው የንብረት ዋጋ', 'c');
INSERT INTO valuation_type (code, display_value, description, status) VALUES ('investment', 'Investment Value::::::::::::::::የኢንቨስትመንት ዋጋ', 'The value of the property to an owner or prospective owner for investment or operational objectives::::::::::::::::ንብረቱ ለአንድ ባለሃብት ወይም ለወደፊት ባለሀብት ለኢንቨስትመንት ወይም ኦፕሬሽናል አላማዎች ያለው ዋጋ', 'c');
INSERT INTO valuation_type (code, display_value, description, status) VALUES ('insurable', 'Insurable Value::::::::::::::::መድን የሚገባለት ዋጋ', 'Property value for insurance purposes. Excludes site value.::::::::::::::::ለመድን አላማ የንብረት ዋጋ የቦታውን ዋጋ አያካትትም', 'c');


ALTER TABLE valuation_type ENABLE TRIGGER ALL;

SET search_path = application, pg_catalog;

--
-- Data for Name: application_status_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE application_status_type DISABLE TRIGGER ALL;

INSERT INTO application_status_type (code, display_value, status, description) VALUES ('lodged', 'Lodged::::Подано::::مودع::::Déposée::::አቤቱታ ቀርቧል', 'c', 'Application has been lodged and officially received by land office::::Заявление подано и официально принято регистрационным офисом::::Application has been lodged and officially received by land office::::La demande a été déposée et officiellement reçue par l''Officier d''Etat::::ማመልከቻው ቀርቧል፤ የመሬት አስተዳደር ጽ/ቤትም በይፋ ተቀብሎታል ');
INSERT INTO application_status_type (code, display_value, status, description) VALUES ('approved', 'Approved::::Одобрено::::موافق عليه::::Approuvée::::ተፈቅዷል', 'c', '');
INSERT INTO application_status_type (code, display_value, status, description) VALUES ('annulled', 'Annulled::::Аннулировано::::ملغى::::Annulée::::ፈራሽ ተደርጓል', 'c', '');
INSERT INTO application_status_type (code, display_value, status, description) VALUES ('completed', 'Completed::::Завершено::::مكتمل::::Exécutée::::ተጠናቋል', 'c', '');
INSERT INTO application_status_type (code, display_value, status, description) VALUES ('requisitioned', 'On Hold::::::::::::::::ሂደቱ እንዲቆም የተደረገ', 'c', '');


ALTER TABLE application_status_type ENABLE TRIGGER ALL;

--
-- Data for Name: application_action_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE application_action_type DISABLE TRIGGER ALL;

INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('assign', 'Assign::::Назначено::::تعيين::::Assigner::::መድብ', NULL, 'c', '');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('cancel', 'Cancel application::::Отменено::::الغاء طلب::::Annuler Demande::::ማመልከቻ ሰርዝ', 'annulled', 'c', 'Application cancelled by Land Office (action is automatically logged when application is cancelled)::::Отмена исполнения заявления::::Application cancelled by Land Office (action is automatically logged when application is cancelled)::::La demande est annulée par l''Officier d''Etat (l''action est automatiquement déposée quand la demande est annulée)::::ማመልከቻ በመሬት አስተዳደር ጽ/ቤት ተሰርዟል (ማመልከቻ ሲሰርዝ ተግባሩ ወዲያው ይመዘገባል)');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('validatePassed', 'Quality Check Passes::::Успешная проверка качества::::عملية التحقق تمت بنجاح::::Le Contrôle Qualité a réussi::::የጥራት ቁጥጥር አልፏል', NULL, 'c', 'Quality check passes (automatically logged when business rules are run without any critical failures)::::Успешная проверка качества::::Quality check passes (automatically logged when business rules are run without any critical failures)::::Le Contrôle Qualité a réussi (automatiquement déposé  quand des règles métier sont passées sans erreur critique)::::የጥራት ቁጥጥር አልፏል (የአሰራር ደንቦች ምንም ወሳኝ መክሸፍት ሳይደርስባቸው ማስኬድ ከተቻለ ወዲያው ይመዘግባል)');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('validateFailed', 'Quality Check Fails::::Проверка качества вернула ошибки::::فشلت عملية التحقق::::Le Contrôle Qualité a échoué::::የጥራት ቁጥጥር ከሽፏል ', NULL, 'c', 'Quality check fails (automatically logged when a critical business rule failure occurs)::::Ошибки при проверки качества будут автоматически записаны в лог системы::::Quality check fails (automatically logged when a critical business rule failure occurs)::::Le Contrôle Qualité a échoué (automatiquement déposé  quand un échec de règle métier critique se produit)::::የጥራት ቁጥጥር ከሽፏል (ወሳኝ የአሰራር ደንብ ከከሸፈ ወዲያው ይመዘገባል)');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('lodge', 'Lodgement Notice Prepared::::Подготовлено уведомление об оплате::::تم تحضير ملاحظة الايداع::::Notice de dépôt préparée::::የአቤቱታ ማስታወቂያ ተዘጋጅቷል', 'lodged', 'c', 'Lodgement notice is prepared (action is automatically logged when application details are saved for the first time::::Подготовлено уведомление об оплате::::Lodgement notice is prepared (action is automatically logged when application details are saved for the first time::::La notice de dépôt set préparée (l''action est automatiquement déposée quand les détails de la demande sont sauvegardé pour la première fois)::::የአቤቱታ ማስታወቂያ ተዘጋጅቷል (የማመልከቻ ዝርዝሮች ለመጀመሪያ ጊዜ እንዲቆዩ ሲደረግ ድርጊቱ ወዲያው ይመዘገባል)');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('unAssign', 'Unassign::::Освобождено::::الغاء تعيين::::Retirer::::አትመድብ/ውሰድ', NULL, 'c', '');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('requisition', 'Hold::::::::::::::::ያዝ (አቆይ)', 'requisitioned', 'c', 'Further information requested from applicant (action is manually logged)::::Дальнейшая информация запрошена у заявителя::::Further information requested from applicant (action is manually logged)::::Plus d''informations requises de la part du demandeur (l''action est automatiquement déposée)::::ተጨማሪ መረጃ ከአመልካች ተጠይቋል (ተግባሩ በማንዋል ተመዝግቧል)');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('archive', 'Archive::::Помещено в архив::::ارشفة::::Archiver::::ማሕደር', 'completed', 'c', 'Paper application records are archived (action is manually logged)::::Отправление в архив бумажной копии заявления::::Paper application records are archived (action is manually logged)::::Les papiers de demande  sont archivés (l''action est manuellement déposée)::::የወረቀት ማመልከቻ ሪከርዶች በማህደር እንዲገቡ ተደርጓል (ተግባሩ በማኑዋል  ተመዝግቧል)');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('approve', 'Approve::::Одобрено::::الموافقة::::Approver::::ፍቃድ', 'approved', 'c', 'Application is approved (automatically logged when application is approved successively)::::Заявление одобрено::::Application is approved (automatically logged when application is approved successively)::::La demande est approuvée (automatiquement déposé  quand la demande est approuvée avec succès)::::ማመልከቻው ተፈቅዷል (ማመልከቻው በተከታታየ ሲፈቀድ ወዲያው ይመዘገባል)');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('addDocument', 'Add document::::Добавлен документ::::اضافة وثيقة::::Ajouter Document::::ሰነድ ጨምር (አክል)', NULL, 'c', 'Scanned Documents linked to Application (action is automatically logged when a new document is saved)::::Добавление документа к заявлению::::Scanned Documents linked to Application (action is automatically logged when a new document is saved)::::Les documents scannés sont liés à la demande (l''action est automatiquement déposée quand un nouveau document est sauvegardé)::::ስካንድ ሰነዶች ከማመልከቻው ጋር ተቆራኝቷል (አዲስ ሰነድ ሲኖር ድርጊቱ ወዲያው ይመዘገባል)');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('lapse', 'Lapse::::Помечено как устарешее::::مضى عليه زمن::::Erreur::::ጊዜው ያለፈ', 'annulled', 'c', '');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('addSpatialUnit', 'Add spatial unit::::Add spatial unit::::Add spatial unit::::Add spatial unit::::ስፓሻል አሀድ ደምር', NULL, 'c', '');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('resubmit', 'Resume::::::::::::::::ቀጥል', 'lodged', 'c', '');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('validate', 'Validate::::Проверено::::التحقق من صحة البيانات::::Valider::::አጽድቅ', NULL, 'c', 'The action validate does not leave a mark, because validateFailed and validateSucceded will be used instead when the validate is completed.::::The action validate does not leave a mark, because validateFailed and validateSucceded will be used instead when the validate is completed.::::The action validate does not leave a mark, because validateFailed and validateSucceded will be used instead when the validate is completed.::::L''action valider ne laisse pas de trace car Erreur de Validation (validateFailed) et Succès de Validation (validateSucceded) seront utilisés quand la validation est exécutée.::::የማረጋገጡ ተግባር ሲጠናቀቅ የማረጋገጥ ተግባሩ ምልክት አይተውም ምክንያቱም ማረጋገጡ አልተሳካም እና ማረጋገጡ ተሳክቷል የሚሉትን በምትክ ጥቅም ላይ ስለሚዉሉ ነው');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('withdraw', 'Withdraw application::::Забрано::::اسحب الطلب::::Retirer Demande::::ማመልከቻ አውጣ', 'annulled', 'c', 'Application withdrawn by Applicant (action is manually logged)::::Заявление было забрано заявителем::::Application withdrawn by Applicant (action is manually logged)::::Demande retirée par le demandeur (l''action est automatiquement déposée)::::አመልካች ማመልከታቸውን አንስቷል (ተግባሩ በማንዋል ተመዝግቧል)');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('dispatch', 'Dispatch::::Отослано::::توزيع::::Envoyer::::ላክ', NULL, 'c', 'Application documents and new land office products are sent or collected by applicant (action is manually logged)::::Документы заявления отсылаются заявителю или он забирает их сам::::Application documents and new land office products are sent or collected by applicant (action is manually logged)::::Les documents de demande et les produits du nouveau bureau du foncier sont envoyés à ou collecté par le demandeur (l''action est manuellement déposée)::::የማመልከቻ ሰነዶች እና አዲሰ የመሬት አስተዳደር ጽ/ቤት አገልግሎቶች ተልኳል ወይም አመልካቹ ወስዷቸዋል (ተግባሩ በማንዋል ተመዝግቧል)');


ALTER TABLE application_action_type ENABLE TRIGGER ALL;

--
-- Data for Name: authority; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE authority DISABLE TRIGGER ALL;

INSERT INTO authority (code, display_value, description, status) VALUES ('tribunal', 'Tribunal::::::::::::::::ጉባዔ', 'A tribunal is being used to help resolve the dispute or objection.::::::::::::::::ክርክሩን ወይም ተቃውሞውን የፍትሕ አካል እየተመለከተው ነው', 'c');
INSERT INTO authority (code, display_value, description, status) VALUES ('mediator', 'Mediator::::::::::::::::ሸምጋይ', 'A mediator is being used to help resolve the dispute or objection.::::::::::::::::ክርክሩን ወይም ተቃውሞውን ሸምጋይ እየተመለከተው ነው', 'c');
INSERT INTO authority (code, display_value, description, status) VALUES ('court', 'Court::::::::::::::::ፍርድ ቤት', 'A court is being used to help resolve the dispute or objection.::::::::::::::::ክርክሩን ወይም ተቃውሞውን ፍርድ ቤት እየተመለከተው ነው', 'c');


ALTER TABLE authority ENABLE TRIGGER ALL;

--
-- Data for Name: checklist_group; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE checklist_group DISABLE TRIGGER ALL;

INSERT INTO checklist_group (code, display_value, description, status) VALUES ('voluntary', 'Voluntary Acquisition::::::::::::::::በፈቃደኝነት መያዝ', 'Items to confirm when using voluntary powers to acquire new land for state purposes::::::::::::::::መንግስት አዲስ መሬት በፈቃደኝነት በሚያገኝበት ጊዜ መረጋገጥ ያለባቸው ጉዳዩች', 'c');
INSERT INTO checklist_group (code, display_value, description, status) VALUES ('lease', 'Lease::::::::::::::::ሊዝ', 'Items to confirm when leasing new land for state purposes::::::::::::::::ለመንግስት አላማዎች አዲስ መሬት ሊዝ በሚደረግለት ጊዜ መረጋገጥ ያለባቸው ጉዳዮች', 'c');
INSERT INTO checklist_group (code, display_value, description, status) VALUES ('compulsory', 'Compulsory Acquisition::::::::::::::::የንብረት ማስለቀቅ', 'Items to confirm when using compulsory powers to acquire new land for state purposes::::::::::::::::መንግስት አዲስ መሬት በግዴታ በሚወስድበት ጊዜ መረጋገጥ ያለባቸው ጉዳዩች', 'c');


ALTER TABLE checklist_group ENABLE TRIGGER ALL;

--
-- Data for Name: checklist_item; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE checklist_item DISABLE TRIGGER ALL;

INSERT INTO checklist_item (code, display_value, description, status, display_order) VALUES ('publishPlan', 'Publish Plan::::::::::::::::ዕቅድ አትም', 'The plan outlining the requirements for land to be acquired has been published::::::::::::::::መሬት ለማግኘት የሚያስፈልጉ መስፈርቶች የሚዘረዝረው እቅድ ታትሟል', 'c', 20);
INSERT INTO checklist_item (code, display_value, description, status, display_order) VALUES ('conditions', 'Lease Conditions::::::::::::::::የሊዝ ገደቦች ', 'Lease conditions have been negotiated and agreeded::::::::::::::::የሊዝ ገደቦች ድርድር ተደረጎባቸው ስምምነት ላይ ተደርሷል', 'c', 70);
INSERT INTO checklist_item (code, display_value, description, status, display_order) VALUES ('transferDocs', 'Transfer Documents::::::::::::::::የማስተላለፊያ ሰነዶች', 'Documents to transfer land have been prepared and submitted to the Land Registration Authority::::::::::::::::መሬት ለማስተላለፍ የሚረዱ ሰነዶች ተዘጋጅተው ለመሬት መዝግበው ባለስልጣን ቀርበዋል', 'c', 60);
INSERT INTO checklist_item (code, display_value, description, status, display_order) VALUES ('consents', 'Consents::::::::::::::::ነጻ ስምምነት', 'Any planning consents for the proposed works have been obtained from the appropriate authority.::::::::::::::::ለታቀዱት ስራዎች የፕላን ስምምነቶች ከሚመለከተው ባለስልጣን ተገኝቷል ', 'c', 40);
INSERT INTO checklist_item (code, display_value, description, status, display_order) VALUES ('landIdentified', 'Land Identified::::::::::::::::መሬት ተላልፏል', 'All land affected by the proposed works has been identified ::::::::::::::::የታቀደው ስራ የሚነካቸው ሁሉንም መሬቶች ተለይዋል', 'c', 10);
INSERT INTO checklist_item (code, display_value, description, status, display_order) VALUES ('regInterests', 'Registered Interests::::::::::::::::የተመዘገቡ ጥቅሞች', 'All interests registered on the land have been investigated and addressed.::::::::::::::::መሬቱ ላይ የተመዘገቡት ሁሉንም ጥቅሞች ተመርምረው መፍትሔ ተሰጥቷቸዋል', 'c', 50);
INSERT INTO checklist_item (code, display_value, description, status, display_order) VALUES ('notifyLandholders', 'Notify Landholders::::::::::::::::ባለመሬቶችን  ያሳውቃል', 'All affected landholders and adjoining landholders have been notified of the works to be undertaken.::::::::::::::::ሊሰራ የታሰበው ስራ ለሁሉም የሚመለከታቸው ባለመሬቶች እና አዋሳኝ ባለመሬቶች እንዲያውቁት ተደርጓል', 'c', 30);


ALTER TABLE checklist_item ENABLE TRIGGER ALL;

--
-- Data for Name: checklist_item_in_group; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE checklist_item_in_group DISABLE TRIGGER ALL;

INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('compulsory', 'landIdentified');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('compulsory', 'publishPlan');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('compulsory', 'notifyLandholders');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('compulsory', 'consents');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('compulsory', 'regInterests');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('compulsory', 'transferDocs');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('voluntary', 'landIdentified');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('voluntary', 'consents');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('voluntary', 'regInterests');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('voluntary', 'transferDocs');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('lease', 'landIdentified');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('lease', 'conditions');


ALTER TABLE checklist_item_in_group ENABLE TRIGGER ALL;

--
-- Data for Name: negotiate_status; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE negotiate_status DISABLE TRIGGER ALL;

INSERT INTO negotiate_status (code, display_value, description, status) VALUES ('withdrawn', 'Withdrawn::::::::::::::::ወጥቷል', 'The initiating party has withdrawn their offer and stopped further negotiation.::::::::::::::::የቅድሚያ ተነሳሽነት የወሰደው ወገን የውል እንግባ ጥያቄውን ትቷል (አንስቷል) ቀጣይ ድርድርም አቁሟል', 'c');
INSERT INTO negotiate_status (code, display_value, description, status) VALUES ('rejected', 'Rejected::::::::::::::::ውድቅ ተደርጓል', 'The party that received the original offer has rejected it and stopped further negotiation.::::::::::::::::የመጀመሪያው ጥያቄ የደረሰው ወገን ውድቅ አድርጎታል እናም ቀጣይ ድርድርም ማድረግ አቁሟል', 'c');
INSERT INTO negotiate_status (code, display_value, description, status) VALUES ('pending', 'Pending::::::::::::::::በእንጥልጥል ላይ', 'The offer is being prepared and has not been presented to the other party yet.::::::::::::::::የውል እንዋዋል ጥያቄ እየተዘጋጀ ይገኛል፤ ለሌላው ተዋዋይ ወገን ገና አልተፈቀደም', 'c');
INSERT INTO negotiate_status (code, display_value, description, status) VALUES ('notified', 'Notified::::::::::::::::እንዲያውቁት ተደርጓል ', 'The purchaser has notified or presented an offer to the vendor for their consideration.::::::::::::::::የውል እንዋዋል ጥያቄ ገዥ ለሻጭ እንዲያጤነው አቀረበለት', 'c');
INSERT INTO negotiate_status (code, display_value, description, status) VALUES ('negotiating', 'Negotiating::::::::::::::::በድርድር ላይ', 'The parties are negotiating the price and/or conditions.::::::::::::::::ተዋዋይ ወገኖች ስለዋጋና/ወይም ሁኔታዎችን እየተደራደሩ ነው፡፡', 'c');
INSERT INTO negotiate_status (code, display_value, description, status) VALUES ('completed', 'Completed::::::::::::::::ተጠናቋል', 'The negotiation is complete and all necessary paperwork has been finalized.::::::::::::::::ድርድሩ ተጠናቋል እና ሁሉንም አስፈላጊ የወረቀት ሥራ ተጠናቋል', 'c');


ALTER TABLE negotiate_status ENABLE TRIGGER ALL;

--
-- Data for Name: negotiate_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE negotiate_type DISABLE TRIGGER ALL;

INSERT INTO negotiate_type (code, display_value, description, status) VALUES ('open', 'Open Market::::::::::::::::ግልጽ ገበያ', 'The negotiation is free and open and neither party is required to participate.::::::::::::::::ድርድሩ ነጻ እና ግልጽ ነው፤ ማናቸውም ወገን እንዲሳተፍ አይገደድም', 'c');
INSERT INTO negotiate_type (code, display_value, description, status) VALUES ('lease', 'Lease::::::::::::::::ሊዝ', 'The negotiation in relation to leasing rather purchasing the property.::::::::::::::::ድርድሩ የሚመለከተው ንብረቱን ለመግዛት ሳይሆን ሊዝ ለማድረግ ነዉ', 'c');
INSERT INTO negotiate_type (code, display_value, description, status) VALUES ('compulsory', 'Compulsory::::::::::::::::በግዳጅ', 'The parties are compelled to negotiation by statute or other legal requirement.::::::::::::::::ተዋዋይ ወገኖች በሕግ እንዲደራደሩ ይገደዳሉ', 'c');


ALTER TABLE negotiate_type ENABLE TRIGGER ALL;

--
-- Data for Name: notify_relationship_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE notify_relationship_type DISABLE TRIGGER ALL;

INSERT INTO notify_relationship_type (code, display_value, description, status) VALUES ('rightHolder', 'Rightholder::::::::::::::::ባለመብት', 'Party to notify has a recognized right or interest (e.g. easement) over the land affected by the job::::::::::::::::ማስታወቂያ ሊሰጠው የሚገባው ባለጉዳይ በስራው የሚነካው ዕውቅና የተሰጠው መብት ወይም ጥቅም (ምሳሌ የንብረት አገልግሎት) ያለው ወገን ነው', 'c');
INSERT INTO notify_relationship_type (code, display_value, description, status) VALUES ('owner', 'Owner::::::::::::::::ባለሀብት', 'Party to notify is an owner of land affected by the job.::::::::::::::::ማስታወቂያ ሊሰጠው የሚገባው ባለጉዳይ በስራው የሚነካው የመሬቱ ባለሀብት ነው', 'c');
INSERT INTO notify_relationship_type (code, display_value, description, status) VALUES ('other', 'Other::::::::::::::::ሌላ', 'Party to notify has a general interest in the land but is not an owner, rightholder, occuiper or tenant of the land affected by the job.::::::::::::::::ማስታወቂያ ሊሰጠው የሚገባው ባለጉዳይ በመሬቱ ላይ አጠቃላይ ጥቅም ያለው ነገር ግን በስራው የሚነካ ባለሀብት፤ ባለመብት፤ ባለይዞታ ወይም ተከራይ ያልሆነ ነው', 'c');
INSERT INTO notify_relationship_type (code, display_value, description, status) VALUES ('occupier', 'Occupier::::::::::::::::ባለይዞታ', 'Party to notify is and occupier or tenant of the land affected by the job::::::::::::::::ማስታወቂያ የሚሰጠው መሬቱን ለያዘው ወይም ለተከራየው እና በስራው የሚነካ ባለጉዳይ ነው', 'c');
INSERT INTO notify_relationship_type (code, display_value, description, status) VALUES ('adjoiningOwner', 'Adjoining Owner::::::::::::::::አዋሳኝ ባለሀብት', 'Party to notify is an owner of land adjoining the land affected by the job::::::::::::::::ማስታወቂያ ሊሰጠው የሚገባው ባለጉዳይ በስራው የሚነካው የአጎራባች መሬት ባለሀብት ነው', 'c');
INSERT INTO notify_relationship_type (code, display_value, description, status) VALUES ('adjoiningOccupier', 'Adjoining Occupier::::::::::::::::አዋሳኝ ባለይዞታ', 'Party to notify is an occupier or tenant of land adjoining the land affected by the job::::::::::::::::ማስታወቂያ ሊሰጠው የሚገባው ባለጉዳይ በስራው የሚነካው የአጎራባች መሬት ባለይዞታ ወይም ተከራይ ነው', 'c');


ALTER TABLE notify_relationship_type ENABLE TRIGGER ALL;

--
-- Data for Name: objection_status; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE objection_status DISABLE TRIGGER ALL;

INSERT INTO objection_status (code, display_value, description, status) VALUES ('withdrawn', 'Withdrawn::::::::::::::::ወጥቷል', 'The parties lodging the objection have withdrawn it.::::::::::::::::ተቃውሞውን ያቀረቡት ወገኖች ትተውታል', 'c');
INSERT INTO objection_status (code, display_value, description, status) VALUES ('open', 'Open::::::::::::::::ግልጽ ', 'The objection is being assessed and relevant actions to resolve the objection are in progress.::::::::::::::::ተቃውሞው እየተገመገመ ይገኛል እና ለተቃውሞው ተገቢ መፍትሄ በመወሰድ ላይ ነው', 'c');
INSERT INTO objection_status (code, display_value, description, status) VALUES ('lodged', 'Lodged::::::::::::::::አቤቱታ ቀርቧል', 'The objection hs been lodged but has yet to be assessed.::::::::::::::::ተቃውሞው ቀርቧል ነገር ግን አልተገመገመም', 'c');
INSERT INTO objection_status (code, display_value, description, status) VALUES ('appeal', 'Appeal::::::::::::::::ይግባኝ', 'The resolution proposed for the objection is being appealled by one or more parties.::::::::::::::::ለተቃውሞ የቀረበው መፍትሔ በአንድ ወይም ከዚያ በላይ ወገኖች ይግባኝ እየቀረበበት ነው', 'c');
INSERT INTO objection_status (code, display_value, description, status) VALUES ('resolved', 'Resolved::::::::::::::::ተፈትቷል', 'A suitable resolution has been reached with all parties invovled. No further actions are requried.::::::::::::::::ሁሉንም ባለጉዳዮች ያሳተፈ ተስማሚ መፍትሄ ላይ ተደርሷል፤ ሌላ ተጨማሪ እርምጃ አያስፈልግም', 'c');
INSERT INTO objection_status (code, display_value, description, status) VALUES ('closed', 'Closed::::::::::::::::ተዘግቷል', 'A resolution for the objection has been perscribed by the relavant authority.::::::::::::::::የሚመለከተው ባለስልጣን ለተቃውሞው የመፍትሄ ሀሳብ ሰጥቷል', 'c');


ALTER TABLE objection_status ENABLE TRIGGER ALL;

--
-- Data for Name: public_display_status; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE public_display_status DISABLE TRIGGER ALL;

INSERT INTO public_display_status (code, display_value, description, status) VALUES ('ready', 'Ready::::::::::::::::ዝግጁ', 'Item is ready for public display::::::::::::::::መረጃው ለሕዝብ እይታ ዝግጁ ነው', 'c');
INSERT INTO public_display_status (code, display_value, description, status) VALUES ('proposed', 'Proposed::::::::::::::::የውሳኔ ሃሳብ ቀረበ', 'Item is proposed for public display::::::::::::::::መረጃው ለሕዝብ እንዲታይ ሀሳብ ቀርቧል', 'c');
INSERT INTO public_display_status (code, display_value, description, status) VALUES ('withdrawn', 'Withdrawn::::::::::::::::ወጥቷል', 'Item is being withdrawn from public display::::::::::::::::መረጃው ከሕዝብ እይታ እንዲርቅ ሀሳብ ቀርቧል', 'c');
INSERT INTO public_display_status (code, display_value, description, status) VALUES ('beingPreped', 'Being Prepared::::::::::::::::በመዘጋጀት ላይ ', 'Item is being prepared for public display::::::::::::::::መረጃው ለሕዝብ እይታ እየተዘጋጀ ነው', 'c');


ALTER TABLE public_display_status ENABLE TRIGGER ALL;

--
-- Data for Name: public_display_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE public_display_type DISABLE TRIGGER ALL;

INSERT INTO public_display_type (code, display_value, description, status) VALUES ('website', 'Website::::::::::::::::ድረ-ገጽ', 'The item for display is a website or website page::::::::::::::::በኮምፒተሩ የታየው ጉዳይ ድረ-ገጽ ወይም የድረ-ገጽ አንድ ክፍል ነው', 'c');
INSERT INTO public_display_type (code, display_value, description, status) VALUES ('newspaper', 'Newspaper::::::::::::::::ጋዜጣ', 'Item a newspaper advert or notice::::::::::::::::መረጃው የጋዜጣ ማስታወቂያ ወይም ማስጠንቀቂያ ነው', 'c');
INSERT INTO public_display_type (code, display_value, description, status) VALUES ('gazette', 'Gazette Notice::::::::::::::::የጋዜጣ ማስታወቂያ', 'Item is a gazette notice::::::::::::::::መረጃው የጋዜጣ ማስታወቂያ ነው', 'c');
INSERT INTO public_display_type (code, display_value, description, status) VALUES ('displayMap', 'Display Map::::::::::::::::ካርታ አሳይ ', 'Item for display is a Public Display Map illustrating the location of parcels affected::::::::::::::::የተባለው መረጃ የሚመለከታቸው ቁራሽ መሬቶች የሚገኙበት ቦታ የሚያሳይ ካርታ ነው', 'c');


ALTER TABLE public_display_type ENABLE TRIGGER ALL;

--
-- Data for Name: request_category_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE request_category_type DISABLE TRIGGER ALL;

INSERT INTO request_category_type (code, display_value, description, status) VALUES ('stateLandServices', 'State Land Services::::::::::::::::የመንግስት መሬት አገልግሎቶች', 'Services used to support state land::::::::::::::::የመንግስት መሬትን ለመደገፍ የሚውሉ አገልግሎቶች', 'c');
INSERT INTO request_category_type (code, display_value, description, status) VALUES ('informationServices', 'Information Services::::Информационные услуги::::خدمات معلوماتية::::Services Information::::የመረጃ አገልግሎቶች', '...::::...::::خدمات معلوماتية::::...::::...', 'c');
INSERT INTO request_category_type (code, display_value, description, status) VALUES ('registrationServices', 'Registration Services::::Регистрационные услуги::::خدمات تسجيل::::Services Enregistrement::::የምዝገባ አገልግሎቶች', '...::::...::::خدمات تسجيل::::...::::...', 'c');


ALTER TABLE request_category_type ENABLE TRIGGER ALL;

--
-- Data for Name: request_display_group; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE request_display_group DISABLE TRIGGER ALL;

INSERT INTO request_display_group (code, display_value, description, status) VALUES ('property', 'Property::::::::::::::::ንብረት ', 'Property display group.::::::::::::::::የንብረት ማሳያ ስብስብ', 'c');
INSERT INTO request_display_group (code, display_value, description, status) VALUES ('parcels', 'Parcels::::::::::::::::ቁራሽ መሬቶች ', 'Parcels display group.::::::::::::::::ቁራሽ መሬቶች ማሳያ ስብስብ', 'c');
INSERT INTO request_display_group (code, display_value, description, status) VALUES ('lease', 'Leases and Licenses::::::::::::::::ሊዞችና ፈቃዶች', 'Lease and License display group::::::::::::::::የሊዝ እና ፈቃድ ማሳያ ቡድን', 'c');
INSERT INTO request_display_group (code, display_value, description, status) VALUES ('job', 'Job::::::::::::::::ስራ ', 'Job display group.::::::::::::::::ስራ የሚያሳይ ስብስብ', 'c');
INSERT INTO request_display_group (code, display_value, description, status) VALUES ('interest', 'Interests::::::::::::::::ጥቅሞች', 'Interests display group::::::::::::::::ጥቅሞች የሚያሳይ ስብስብ', 'c');
INSERT INTO request_display_group (code, display_value, description, status) VALUES ('claim', 'Claims::::::::::::::::የመብት ጥያቄዎች', 'Claims display group::::::::::::::::የመብት ጥያቄ ማሳያ ስብስብ', 'c');


ALTER TABLE request_display_group ENABLE TRIGGER ALL;

--
-- Data for Name: type_action; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE type_action DISABLE TRIGGER ALL;

INSERT INTO type_action (code, display_value, description, status) VALUES ('new', 'New::::Новый::::جديد::::Nouveau::::አዲስ', '...::::...::::...::::...::::...', 'c');
INSERT INTO type_action (code, display_value, description, status) VALUES ('cancel', 'Cancel::::Отмена::::الغاء::::Annuler::::ሰርዝ', '...::::...::::...::::...::::...', 'c');
INSERT INTO type_action (code, display_value, description, status) VALUES ('vary', 'Vary::::Изменить::::تعديل::::Varier::::አሻሽል', '...::::...::::...::::...::::...', 'c');


ALTER TABLE type_action ENABLE TRIGGER ALL;

--
-- Data for Name: request_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE request_type DISABLE TRIGGER ALL;

INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('removeCaveat', 'registrationServices', 'Remove Caveat::::Снять ограничение::::...::::Supprimer Caveat::::የእክል ማስጠንቀቂያ አስወግድ', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, 'Caveat <reference> removed', 'caveat', 'cancel', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('mapExistingParcel', 'registrationServices', 'Map Existing Parcel::::::::::::::::ቁራሽ መሬቱን ካርታ አንሳ', '', 'x', 30, 0.00, 0.00, 0.00, 0, 'Allows to make changes to the cadastre', NULL, NULL, 'cadastreTransMap', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('recordTransfer', 'informationServices', 'Record transfer::::Record transfer in russian::::Record transfer in arabic::::Record transfer in french::::የንብረት ዝውውር ሪኮርድ አድርግ', '...::::...::::...::::...::::...', 'x', 1, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('documentCopy', 'informationServices', 'Document Copy::::Копия документа::::نسخ وثيقة::::Copie Document::::ሰነድ ቅጂ', '...::::...::::...::::...::::...', 'x', 1, 0.50, 0.00, 0.00, 0, NULL, NULL, NULL, 'documentSearch', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('cadastreChange', 'registrationServices', 'Change to Cadastre::::Изменение кадастра::::تغيير المساحة::::Modification du Cadastre::::ወደ ካዳስተር ለውጥ', '...::::...::::...::::...::::...', 'x', 30, 25.00, 0.10, 0.00, 1, NULL, NULL, NULL, 'cadastreTransMap', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('varyMortgage', 'registrationServices', 'Vary Mortgage::::Изменить ипотеку::::تعديل الرهن.::::Varier Hypothèque::::ዋስትና አሻሽል', '...::::...::::...::::...::::...', 'x', 1, 5.00, 0.00, 0.00, 1, 'Change on the mortgage', 'mortgage', 'vary', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('surveyPlanCopy', 'informationServices', 'Survey Plan Copy::::Копия кадастрового плана::::نسخة خطة مساحة::::Copie Plan de Levé::::የቅየሳ ፕላን ቅጂ', '...::::...::::...::::...::::...', 'x', 1, 1.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'documentSearch', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('varyCaveat', 'registrationServices', 'Vary caveat::::Изменить арест::::تعديل القيد::::Varier Caveat::::የእክል ማስጠንቀቂያን አሻሽል', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, '<Caveat> <reference>', 'caveat', 'vary', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('cancelProperty', 'registrationServices', 'Cancel title::::Прекращение права собственности::::الغاء سند ملكية::::Annuler Titre::::የይዞታ መብት ማረጋገጫ ሰነድ ሰርዝ', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, '', NULL, 'cancel', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('newApartment', 'registrationServices', 'New Apartment Title::::Новое право на квартиру::::سند ملكية . لشقة جديدة::::Titre Nouvel Appartement::::አዲስ የአፓርታማ መብት', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.02, 1, 'Apartment Estate', 'apartment', 'new', 'newProperty', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('systematicRegn', 'registrationServices', 'Systematic Registration Claim::::Запрос на системную регистрацию::::المطالبة بتسجيل منتظم::::Déclaration Enregistrement Systèmatique::::አጠቃላይ የመብት ጥያቄ ምዝገባ', '...::::...::::...::::...::::...', 'x', 90, 50.00, 0.00, 0.00, 0, 'Title issued at completion of systematic registration', 'ownership', 'new', 'newProperty', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('newFreehold', 'registrationServices', 'New Freehold Title::::Новое право собственности (свободное)::::سند ملكية جديد::::Nouveau Titre Propriété::::New Freehold Title', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, 'Fee Simple Estate', NULL, NULL, 'newProperty', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('cadastrePrint', 'informationServices', 'Cadastre Print::::Печать кадастровых данных::::اطبع المساحة::::Imprimer Cadastre::::የካዳስተር ፕሪንት', '...::::...::::...::::...::::...', 'x', 1, 0.50, 0.00, 0.00, 0, NULL, NULL, NULL, 'map', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('lodgeObjection', 'registrationServices', 'Lodge Objection::::Заявление оспаривания права::::اعتراض::::Objection Dépôt::::ተቃውሞ አቅርብ', '...::::...::::...::::...::::...', 'x', 90, 5.00, 0.00, 0.00, 1, NULL, NULL, NULL, 'newProperty', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('noteOccupation', 'registrationServices', 'Occupation Noted::::Уведомление о самозахвате::::ملاحظة استخدام::::Mention Occupation::::ይዞታው ተመልክቷል', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.01, 1, 'Occupation by <name> recorded', NULL, NULL, 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('slInterestChange', 'stateLandServices', 'Change Interest::::::::::::::::ጥቅም ለውጥ', 'Update the details of an existing interest::::::::::::::::አንድ ያለን ጥቅም ዝርዝር ጉዳዮች ወቅታዊ ያደርጋል', 'c', 5, 0.00, 0.00, 0.00, 1, NULL, NULL, 'vary', 'slProperty', 'interest', 140);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('serviceEnquiry', 'informationServices', 'Service Enquiry::::Запрос информации о заявлении::::طلب معلومات::::Service Enquête::::የመረጃ አገልግሎት ጥያቄ', '...::::...::::...::::...::::...', 'x', 1, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'applicationSearch', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('slLeaseCancel', 'stateLandServices', 'Cancel Lease::::::::::::::::ሊዝ ሰረዝ', 'Cancel an existing lease.::::::::::::::::ያለ ሊዝ ሰርዝ', 'c', 5, 0.00, 0.00, 0.00, 1, NULL, 'lease', 'cancel', 'slProperty', 'lease', 90);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('cadastreBulk', 'informationServices', 'Cadastre Bulk Export::::Массовая загрузка кадастровых данных::::تصدير  رزمة مساحة::::Export Cadastre Groupé::::ካዳሰተር ጅምላ ኤክስፖርት', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.10, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('regnPowerOfAttorney', 'registrationServices', 'Registration of Power of Attorney::::Регистрация доверенности::::تسجيل وكالة::::Enregistrement de la Procuration::::የውክልና ሰነድ ምዝገባ', '...::::...::::...::::...::::...', 'x', 3, 5.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'documentTrans', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('cadastreExport', 'informationServices', 'Cadastre Export::::Экспорт кадастра еще текст::::تصدير المساحة::::Exporter Cadastre::::ካዳሰተር ኤክስፖርት', '...::::::::...::::...::::...', 'x', 1, 0.00, 0.10, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('regnOnTitle', 'registrationServices', 'Registration on Title::::Регистрация права собственности::::...::::Enregistrement du Titre::::በባለይዞታ መብት ማረጋገጫ ሰነድ ላይ ምዝገባ', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.01, 1, NULL, NULL, NULL, 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('caveat', 'registrationServices', 'Register Caveat::::Регистрация ареста::::تسجيل  قيد::::Enregistrer Caveat::::የእክል ማስጠንቀቂያ መዝግብ', '...::::...::::...::::...::::...', 'x', 5, 50.00, 0.00, 0.00, 1, 'Caveat in the name of <name>', 'caveat', 'new', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('newOwnership', 'registrationServices', 'Change of Ownership::::Смена владельца::::تغيير الملكية::::Changement de propriétaire::::የባለሀብትነት ለውጥ', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.02, 1, 'Transfer to <name>', 'ownership', 'vary', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('newState', 'registrationServices', 'New State Title::::Новое право собственности (государственное)::::سند ملكية عقار جديد::::Nouveau Titre d''Etat::::አዲስ የመንግስት ይዞታ መብት ማረጋገጫ ሰነድ', '...::::...::::...::::...::::...', 'x', 5, 0.00, 0.00, 0.00, 1, 'State Estate', NULL, NULL, 'newProperty', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('buildingRestriction', 'registrationServices', 'Register Building Restriction::::Регистрация ограничения на строение::::تسجيل قيود بناية::::Enregistrer Restriction de Bâtiment::::የሕንፃ ገደብ መዝግብ', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, 'Building Restriction', 'noBuilding', 'new', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('limitedRoadAccess', 'registrationServices', 'Register Limited Road Access::::Регистрация ограниченного доступа к дороги::::تسجيل  دخول طريق محدودة::::Enregistrer Route Accès Limité::::ውስን የመንገድ ማለፊያ መዝግብ', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, 'Limited Road Access', 'limitedAccess', NULL, 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('servitude', 'registrationServices', 'Register Servitude::::Регистрация сервитута::::حق استخدام الطريق::::Enregistrer Servitude::::የንብረት አገልግሎት መዝግብ', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, 'Servitude over <parcel1> in favour of <parcel2>', 'servitude', 'new', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('usufruct', 'registrationServices', 'Register Usufruct::::Регистрация права пользования ресурсами::::حق الانتفاع::::Enregistrer Usufruit::::የአላባ መብት መዝግብ', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, '<usufruct> right granted to <name>', 'usufruct', 'new', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('mortgage', 'registrationServices', 'Register Mortgage::::Регистрация ипотеки::::تسجيل رهن::::Enregistrer Hypothèque::::የዋስትና መብት መዝግብ', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, 'Mortgage to <lender>', 'mortgage', 'new', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('removeRight', 'registrationServices', 'Remove Right (General)::::Прекратить право::::الغاء حق (عام)::::Supprimer Droit (Général)::::መብት አስወግድ (አጠቃላይ)', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, '<right> <reference> cancelled', NULL, 'cancel', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('publicDisplayMap', 'stateLandServices', 'Public Display Map::::::::::::::::ለሕዝብ የሚታይ ካርታ ', 'Generates a map of the job area for public display purposes::::::::::::::::የተፈለገው ቦታ ለሕዝብ እንዲታይ የሚረዳ ካርታ ያመነጫል', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'publicDisplayMap', 'job', 200);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('regnDeeds', 'registrationServices', 'Deed Registration::::Регистрация сделки::::تسجيل حركة::::Enregistrement Acte::::የንብረት ማስተላለፊያ ሰነድ ምዝገባ', '...::::...::::...::::...::::...', 'x', 3, 1.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('slInterest', 'stateLandServices', 'Record Interest::::::::::::::::ጥቅም ሪኮርድ አድርግ', 'Record a new interest over an existing State Land Property::::::::::::::::በመንግስት መሬት ላይ ያለ አዲስ ጥቅም ሪኮርድ አድርግ', 'c', 5, 0.00, 0.00, 0.00, 1, NULL, NULL, 'new', 'slProperty', 'interest', 130);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('registerLease', 'registrationServices', 'Register Lease::::Регистрация права пользования::::تسجيل ايجار::::Enregistrer Bail::::ሊዝ መዝግብ', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.01, 1, 'Lease of nn years to <name>', 'lease', 'new', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('slLease', 'stateLandServices', 'Record Lease::::::::::::::::ሊዝ ሪኮርድ አድርግ', 'Record a new lease for an existing State Land Property::::::::::::::::በመንግስት መሬት ላይ ያለ አዲስ ሊዝ ሪኮርድ አድርግ', 'c', 5, 0.00, 0.00, 0.00, 1, NULL, 'lease', 'new', 'slProperty', 'lease', 70);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('newDigitalTitle', 'registrationServices', 'Convert to Digital Title::::Новое право собственности (конвертация)::::تحويل الى سند ملكية الكتروني::::Convertir en Titre Numérique::::ወደ ዲጂታል ሰነድነት ለውጥ', '...::::...::::...::::...::::...', 'x', 5, 0.00, 0.00, 0.00, 1, 'Title converted to digital format', NULL, NULL, 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('recordStateLand', 'stateLandServices', 'Record New Property::::::::::::::::አዲስ ንብረት ሪኮርድ አድርግ', 'Create a new State Land Property::::::::::::::::አዲስ በመንግስት መሬት ላይ ያለ ንብረት አቋቁም', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'newSLProperty', 'property', 20);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('changeSLParcels', 'stateLandServices', 'Create or Change Parcels::::::::::::::::ቁራሽ መሬቶች አቋቁም ወይም ለውጥ', 'Create, change or dispose State Land Parcels::::::::::::::::የመንግስት ቁራሽ መሬቶች አቋቁም፤ ለውጥ ወይም አስተላልፍ', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'cadastreTransMap', 'parcels', 10);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('slLeaseChange', 'stateLandServices', 'Change Lease::::::::::::::::ሊዝ ለውጥ', 'Update the details of an existing lease::::::::::::::::አንድ ያለን ሊዝ ዝርዝር ጉዳዮች ወቅታዊ ያደርጋል', 'c', 5, 0.00, 0.00, 0.00, 1, NULL, 'lease', 'vary', 'slProperty', 'lease', 80);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('cancelInterest', 'stateLandServices', 'Cancel Interest::::::::::::::::ጥቅም ሰርዝ', 'Cancel one or more interests on an existing State Land Property::::::::::::::::በመንግስት መሬት ያለ አንድ ወይም ከዚያ በላይ ጥቅም ሰርዝ', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, 'cancel', 'slProperty', 'interest', 150);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('slClaimCancel', 'stateLandServices', 'Cancel Claim::::::::::::::::የመብት ጥያቄ ሰርዝ', 'Cancel an existing claim::::::::::::::::ያለ የመብት ጥያቄ ሰርዝ', 'c', 5, 0.00, 0.00, 0.00, 1, NULL, 'claim', 'cancel', 'slProperty', 'claim', 180);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('removeRestriction', 'registrationServices', 'Remove Restriction (General)::::Снять ограничение::::ازالة قيد::::Supprimer Restriction (Général)::::ገደብ አስወግድ', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, '<restriction> <reference> cancelled', NULL, 'cancel', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('newDigitalProperty', 'registrationServices', 'New Digital Property::::Регистрация существующего права собственности::::أنشاء سند الكتروني جديد::::Nouvelle Propriété Numérique::::አዲስ የዲጂታል ንብረት', '...::::...::::...::::...::::...', 'x', 5, 0.00, 0.00, 0.00, 1, NULL, NULL, NULL, 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('slNegotiate', 'stateLandServices', 'Manage Negotiations::::::::::::::::ድርጅቶችን አስተዳድር', 'Used for managing negotiations for property acquisition or disposal::::::::::::::::ንብረት ለማግኘት ወይም ለማስተላለፍ የሚደረጉ ድርድሮች (ለማስተዳደር) ይውላል', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'slNegotiate', 'job', 230);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('slClaimChange', 'stateLandServices', 'Change Claim::::::::::::::::የመብት ጥያቄ ለውጥ', 'Update the details of an existing claim::::::::::::::::አንድ ያለን የመብት ጥያቄ ዝርዝር ጉዳዮች ወቅታዊ ያደርጋል', 'c', 5, 0.00, 0.00, 0.00, 1, NULL, 'claim', 'vary', 'slProperty', 'claim', 170);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('redefineCadastre', 'registrationServices', 'Redefine Cadastre::::Изменение кадастрового объекта::::تعديل المساحة::::Redéfinir Cadastre::::ካዳስተር ከልስ', '...::::...::::...::::...::::...', 'x', 30, 25.00, 0.10, 0.00, 1, NULL, NULL, NULL, 'cadastreTransMap', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('waterRights', 'registrationServices', 'Register Water Rights::::Регистрация права пользования водными ресурсами::::تسجيل حق الانتفاع (مياه).::::Enregistrer Droits d''Eau::::የውኃ መብቶች መዝግብ', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.01, 0.00, 1, 'Water Rights granted to <name>', 'waterrights', 'new', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('cnclPowerOfAttorney', 'registrationServices', 'Cancel Power of Attorney::::Нотариальная доверенность::::الغاء التوكيل::::Annuller Procuration::::የውክልና ስልጣን ሰርዝ', '...::::...::::...::::...::::...', 'x', 1, 5.00, 0.00, 0.00, 0, NULL, NULL, 'cancel', 'documentTrans', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('lifeEstate', 'registrationServices', 'Establish Life Estate::::Регистрация пожизненного права пользования::::انشاء تمليك عقار مدى الحياة.::::Constitution Donation au dernier vivant / Viager::::ወደ መአዶሞ ማስፋት', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.02, 1, 'Life Estate for <name1> with Remainder Estate in <name2, name3>', 'lifeEstate', 'new', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('varyLease', 'registrationServices', 'Vary Lease::::Изменить право пользования::::تعديل الايجار::::Varier Bail::::ሊዝ አሻሽል', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, 'Variation of Lease <reference>', 'lease', 'vary', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('titleSearch', 'informationServices', 'Title Search::::Поиск недвижимости::::البحث عن سند ملكية.::::Recherche Titre::::የይዞታ መብት ማረጋገጫ ሰነድ ፍለጋ ', '...::::...::::...::::...::::...', 'x', 1, 5.00, 0.00, 0.00, 1, NULL, NULL, NULL, 'propertySearch', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('slNotify', 'stateLandServices', 'Manage Notifications::::::::::::::::ማሰታወቂያዎችን አስተዳድር', 'Used for generating and managing bulk notifications related to the job::::::::::::::::ከስራ ጋር ተያያዥነት ያላቸው ጅምላ ማስታወቂያዎችን ለማመንጨት እና ለማስተዳደር ይውላል', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'slNotify', 'job', 220);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('slClaim', 'stateLandServices', 'Record Claim::::::::::::::::የጥቅም ጥያቄ ሪኮርድ አድርግ', 'Record a new claim affecting an existing State Land Property::::::::::::::::የመንግስት መሬት የሚነካ አዲስ የመብት ጥያቄ ሪኮርድ አድርግ', 'c', 5, 0.00, 0.00, 0.00, 1, NULL, 'claim', 'new', 'slProperty', 'claim', 160);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('maintainStateLand', 'stateLandServices', 'Maintain Property::::::::::::::::ንብረት ጠብቅ', 'Add or change details for an existing State Land Property including interests, parcels and relationships::::::::::::::::የመንግስት መሬት ላይ የተቋቋመ እንደ ጥቅሞች፤ ቁራሽ መሬቶች እና ግንኙነቶች ያለ ንብረት ዝርዝር ጉዳይ ጨምር ወይም ለውጥ', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'slProperty', 'property', 30);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('slLicense', 'stateLandServices', 'Record License::::::::::::::::ፈቃድ ሪኮርድ አድርግ', 'Record a new license for an existing State Land Property::::::::::::::::በመንግስት መሬት ላይ ያለ አዲስ ፈቃድ ሪኮርድ አድርግ', 'c', 5, 0.00, 0.00, 0.00, 1, NULL, 'license', 'new', 'slProperty', 'lease', 100);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('slObjection', 'stateLandServices', 'Manage Objections::::::::::::::::ተቃውሞዎችን አስተዳድ', 'Records details of objections raised by parties affected by State Land activities::::::::::::::::በመንግስት መሬት ላይ እንቅስቃሴዎች በተመለከተ ሰዎች ያነሱዋቸው ተቃውሞዎች ዝርዝር ሪኮርድ ያደርጋል ', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'slObjection', 'job', 240);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('slLicenseChange', 'stateLandServices', 'Change License::::::::::::::::ፈቃድ ለውጥ', 'Update the details of an existing license::::::::::::::::አንድ ያለን ፈቃድ ዝርዝር ጉዳዮች ወቅታዊ ያደርጋል', 'c', 5, 0.00, 0.00, 0.00, 1, NULL, 'license', 'vary', 'slProperty', 'lease', 110);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('historicOrder', 'registrationServices', 'Register Historic Preservation Order::::Регистрация недвижимости исторического назначения::::تسجيل امر حفظ تاريخي::::Enregistrer Ordonnance de Préservation Historique::::የታሪካዊ ንብረቶች ጥበቃ ትዕዛዝ መዝግብ', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, 'Historic Preservation Order', 'noBuilding', 'new', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('checklist', 'stateLandServices', 'Checklist::::::::::::::::መሟላት ያለባቸው ጉዳዮች  ዝርዝር ', 'Identifies a checklist of items to be completed for this Job::::::::::::::::ለዚህ ስራ መደረግ ያለባቸውን ዝርዝር ተግባራት ይለያል', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'checklist', 'job', 190);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('publicDisplay', 'stateLandServices', 'Mangage Public Display::::::::::::::::ለሕዝብ ማሳያ አስተዳድር', 'Can be used to plan and track public display items::::::::::::::::ለሕዝብ እይታ የሚውሉ ጉዳዮች ለማቀድና ለመከታተል ሊውል ይችላል', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'publicDisplay', 'job', 210);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('slLicenseCancel', 'stateLandServices', 'Cancel License::::::::::::::::ፈቃድ ሰርዝ', 'Cancel an existing license::::::::::::::::ያለ ፈቃድ ሰርዝ', 'c', 5, 0.00, 0.00, 0.00, 1, NULL, 'license', 'cancel', 'slProperty', 'lease', 120);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('regnStandardDocument', 'registrationServices', 'Registration of Standard Document::::Регистрация типового документа::::تسجيل وثيقة مرجعية::::Enregistrement du Document Standard::::የስታንዳርድ ሰነድ ምዝገባ', '...::::...::::...::::...::::...', 'x', 3, 5.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'documentTrans', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('cnclStandardDocument', 'registrationServices', 'Withdraw Standard Document::::Удалить типовой документ::::سحب الوثيقة المرجعية::::Retirer Document Standard::::ስታንዳርድ ሰነድ አውጣ', 'To withdraw from use any standard document (such as standard mortgage or standard lease)::::...::::...::::...::::አንድን ስታንዳርድ ሰነድ (እንደ ስታንዳርድ ዋስትና ወይም ስታንዳርድ ሊዝ ያለ) ሥራ ላይ እንዳይውል ማድረግ', 'x', 1, 5.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'documentTrans', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('slValuation', 'stateLandServices', 'Manage Valuations::::::::::::::::የንብረት ግምቶችን አስተዳድር', 'Records details of valuations raised by parties affected by State Land activities::::::::::::::::በመንግስት መሬት ላይ እንቅስቃሴዎች በተመለከተ ሰዎች ያነሱዋቸው የግምት ዝርዝር ጉዳዮች ሪኮርድ ያደርጋል ', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'slValuation', 'property', 40);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('disposeSLProperty', 'stateLandServices', 'Dispose Property::::::::::::::::ንብረት አስተላልፍ', 'Updates a State Land Property to indicate the state has disposed of it::::::::::::::::መንግስት አንድን የመንግስት መሬት ማስተላለፍን በመጠቆም ወቅታዊ ያደርጋል', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, 'cancel', 'slProperty', 'property', 60);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('varyRight', 'registrationServices', 'Vary Right (General)::::Изменить право (общее)::::تعديل حق (عام)::::Varier Droit (Général)::::መብት አሻሽል (አጠቃላይ)', '...::::...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, 'Variation of <right> <reference>', NULL, 'vary', 'property', NULL, NULL);


ALTER TABLE request_type ENABLE TRIGGER ALL;

--
-- Data for Name: service_status_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE service_status_type DISABLE TRIGGER ALL;

INSERT INTO service_status_type (code, display_value, status, description) VALUES ('lodged', 'Lodged::::Зарегистрирован::::مودعة::::Enregistré::::አቤቱታ ቀርቧል', 'c', 'Application for a service has been lodged and officially received by land office::::Заявление было подано и зарегистрировано в регистрационном офисе::::...::::Demande de service a été déposée et officiellement reçue par l''Officier d''Etat::::የአገልግሎት ማመልከቻ ቀርቧል፤ የመሬት አስተዳደር ጽ/ቤትም በይፋ ተቀብሎታል');
INSERT INTO service_status_type (code, display_value, status, description) VALUES ('cancelled', 'Cancelled::::Отменен::::ملغاة::::Annulé::::ተሰርዟል', 'c', '...::::...::::...::::...::::...');
INSERT INTO service_status_type (code, display_value, status, description) VALUES ('pending', 'Pending::::На исполнении::::قيد الانتظار::::En attente::::በእንጥልጥል ላይ', 'c', '...::::...::::...::::::::...');
INSERT INTO service_status_type (code, display_value, status, description) VALUES ('completed', 'Completed::::Завершен::::مكتملة.::::Exécuté::::ተጠናቋል', 'c', '...::::...::::...::::...::::...');


ALTER TABLE service_status_type ENABLE TRIGGER ALL;

--
-- Data for Name: service_action_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE service_action_type DISABLE TRIGGER ALL;

INSERT INTO service_action_type (code, display_value, status_to_set, status, description) VALUES ('cancel', 'Cancel::::Отмена::::الغاء::::Annuler::::ሰርዝ', 'cancelled', 'c', 'Service is cancelled by Land Office (action is automatically logged when a service is cancelled)::::Отмена услуги регистрационным офисом (отмена будет автоматически зафиксирована в журнале событий)::::تم الغاء الخدمة من قبل دائرة الاراضي . الخدمات الملغاة يتم تسجيلها تلقائيا من قبل النظام::::Service annulé par l''Officier d''Etat (action déposée automatiquement quand un service est annulé)::::በሚመለከተው የመሬት አሰተዳደር ጽሕፈት ቤት አገልግሎቱ ተሰርዟል (አገልግሎቱ ሲሰረዝ ድርጊቱ ወዲያው ይመዘገባል)');
INSERT INTO service_action_type (code, display_value, status_to_set, status, description) VALUES ('revert', 'Revert::::Вернуть на доработку::::تراجع::::Retourner::::ወደኃላ መልስ', 'pending', 'c', 'The status of the service has been reverted to pending from being completed (action is automatically logged when a service is reverted back for further work)::::Статус услуги изменен к "исполняется" (событие будет автоматически записано в журнал событий)::::يتم تغيير حالة الخدمة الى  قيد الانتظار عندما تحتاج الخدمة الى مزيد من المعلومات او العمل::::Le statut du service a été retourné du statut "complet" au statut "en attente" (action déposée automatiquement quand un service est retourné pour plus de travail)::::የአገልግሎቱ ሁኔታ ከመጠናቀቅ ወደ እንጥልጥል ተቀይሯል፤ አንድን አገልግሎት ለተጨማሪ ሥራ ወደኋላ ሲመለስ ድርጊቱ ወዲያውኑ ይመዘገባል');
INSERT INTO service_action_type (code, display_value, status_to_set, status, description) VALUES ('start', 'Start::::Запустить::::ابدأ::::Commencer::::ጀምር', 'pending', 'c', 'Provisional RRR Changes Made to Database as a result of application (action is automatically logged when a change is made to a rrr object)::::Определенные изменения должны быть сделаны, относящиеся к услуги (событие будет автоматически записано в журнал событий)::::يتم تسجيل الحالة عندما يحدث تغيير على الكائن::::Changement des RRR provisionnels réalisé dans la base de données suite au résultat de la demande (action déposée automatiquement quand un changement est fait sur un objet RRR)::::በትግበራ የተነሳ በዳታቤዙ ላይ የተደረጉ ጊዜያዊ መገኃ ለውጦች (በመገኃ ነገር ላይ ለውጥ ሲደረግ ድርጊቱ ወዲያው ይመዘገባል)');
INSERT INTO service_action_type (code, display_value, status_to_set, status, description) VALUES ('complete', 'Complete::::Завершить::::انهاء::::...::::መጠናቀቅ', 'completed', 'c', 'Application is ready for approval (action is automatically logged when service is marked as complete::::Заявление готово к одобрению (событие будет автоматически записано в журнал событий)::::الطلب جاهز للموافقة عندما تتغير حالة الخدمة الى مكتملة::::Demande prête pour approbation (action déposée automatiquement quand le service est marqué comme complet)::::ማመልከቻው ሊፈቀድ ዝግጁ ነው (አገልግሎጉ ተጠናቋል የሚል ምልክት ሲደረግበት ተግባሩ ወዲያው ይመዘገባል)');
INSERT INTO service_action_type (code, display_value, status_to_set, status, description) VALUES ('lodge', 'Lodge::::Подать заявление::::ايداع::::Déposer::::አቤቱታ', 'lodged', 'c', 'Application for service(s) is officially received by land office (action is automatically logged when application is saved for the first time)::::Заявление принято официально регистрационным офисом (событие будет автоматически записано в журнал событий)::::.استلام الطلب رسميا من قبل دائرة الاراضي  حيث يتم حفظه بحالة مودع::::Demande de service(s) officiellement reçue par l''Officier d''Etat (action déposée automatiquement quand la demande est sauvegardée pour la première fois)::::የመሬት አስተዳደር ጽ/ቤት የአገልግሎት/ቶች ማመልከቻ በይፋ ተቀብሏል (ማመልከቻ ለመጀመሪያ ጊዜ እንዲቆይ ሲደረግ ድርጊቱ ወዲያው ይመዘገባል)');


ALTER TABLE service_action_type ENABLE TRIGGER ALL;

SET search_path = cadastre, pg_catalog;

--
-- Data for Name: area_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE area_type DISABLE TRIGGER ALL;

INSERT INTO area_type (code, display_value, description, status) VALUES ('calculatedArea', 'Calculated Area::::Вычисленная Площадь::::المساحة المحسوبة::::Superficie Calculée::::የተሰላ ስፋት (ቦታ)', '', 'c');
INSERT INTO area_type (code, display_value, description, status) VALUES ('nonOfficialArea', 'Non-official Area::::Неофициальная Площадь::::Non-official Area::::Superficie Non-officielle::::ይፋዊ ያልሆነ ቦታ', '', 'c');
INSERT INTO area_type (code, display_value, description, status) VALUES ('officialArea', 'Official Area::::Официальная Площадь::::المساحة الرسمية::::Superficie Officielle::::በይፋ የታወቀ ቦታ', '', 'c');
INSERT INTO area_type (code, display_value, description, status) VALUES ('surveyedArea', 'Surveyed Area::::Площадь по Съемке::::المساحة الممسوحة::::Superficie Levée::::የተቀየሰ ቦታ (አካባቢ)', '', 'c');


ALTER TABLE area_type ENABLE TRIGGER ALL;

--
-- Data for Name: building_unit_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE building_unit_type DISABLE TRIGGER ALL;

INSERT INTO building_unit_type (code, display_value, description, status) VALUES ('individual', 'Individual::::Индивидуальное::::فردي::::Individuel::::ግለሰብ', '', 'c');
INSERT INTO building_unit_type (code, display_value, description, status) VALUES ('shared', 'Shared::::Общая::::مشتركة::::Partagé::::ተጋርቷል', '', 'c');


ALTER TABLE building_unit_type ENABLE TRIGGER ALL;

--
-- Data for Name: cadastre_object_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE cadastre_object_type DISABLE TRIGGER ALL;

INSERT INTO cadastre_object_type (code, display_value, description, status, in_topology) VALUES ('parcel', 'Parcel::::Участок::::قطعة::::Parcelle::::ቁራሽ መሬት ', '', 'c', true);
INSERT INTO cadastre_object_type (code, display_value, description, status, in_topology) VALUES ('buildingUnit', 'Building Unit::::Единица Здания::::وحدة بناية::::Bâtiment::::የኮንዶሚኒየም ቤት', '', 'x', false);
INSERT INTO cadastre_object_type (code, display_value, description, status, in_topology) VALUES ('utilityNetwork', 'Utility Network::::Инфраструктурная Сеть::::شبكة خدمات::::Réseaux de services publics::::የአገልግሎት መረብ', '', 'x', false);
INSERT INTO cadastre_object_type (code, display_value, description, status, in_topology) VALUES ('stateLand', 'State Land Parcel::::::::::::::::የመንግስት ቁራሽ መሬት ', '', 'c', false);


ALTER TABLE cadastre_object_type ENABLE TRIGGER ALL;

--
-- Data for Name: dimension_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE dimension_type DISABLE TRIGGER ALL;

INSERT INTO dimension_type (code, display_value, description, status) VALUES ('0D', '0D::::0D::::0D::::0D::::0ዲ', '', 'c');
INSERT INTO dimension_type (code, display_value, description, status) VALUES ('1D', '1D::::1D::::1D::::1D::::1ዲ', '', 'c');
INSERT INTO dimension_type (code, display_value, description, status) VALUES ('2D', '2D::::2D::::2D::::2D::::2ዲ', '', 'c');
INSERT INTO dimension_type (code, display_value, description, status) VALUES ('3D', '3D::::3D::::3D::::3D::::3ዲ', '', 'c');
INSERT INTO dimension_type (code, display_value, description, status) VALUES ('liminal', 'Liminal::::Liminal::::Liminal::::Liminal::::ሊሚናል', '', 'x');


ALTER TABLE dimension_type ENABLE TRIGGER ALL;

--
-- Data for Name: hierarchy_level; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE hierarchy_level DISABLE TRIGGER ALL;

INSERT INTO hierarchy_level (code, display_value, description, status) VALUES ('0', 'Hierarchy 0::::Hierarchy 0::::تسلسل هرمي 0::::Hiérarchie 0::::ተዋረድ 0', '', 'c');
INSERT INTO hierarchy_level (code, display_value, description, status) VALUES ('1', 'Hierarchy 1::::Hierarchy 1::::تسلسل هرمي 1::::Hiérarchie 1::::ተዋረድ 1', '', 'c');
INSERT INTO hierarchy_level (code, display_value, description, status) VALUES ('2', 'Hierarchy 2::::Hierarchy 2::::تسلسل هرمي 2::::Hiérarchie 2::::ተዋረድ 2', '', 'c');
INSERT INTO hierarchy_level (code, display_value, description, status) VALUES ('3', 'Hierarchy 3::::Hierarchy 3::::تسلسل هرمي 3::::Hiérarchie 3::::ተዋረድ 3', '', 'c');
INSERT INTO hierarchy_level (code, display_value, description, status) VALUES ('4', 'Hierarchy 4::::Hierarchy 4::::تسلسل هرمي 4::::Hiérarchie 4::::ተዋረድ 4', '', 'c');


ALTER TABLE hierarchy_level ENABLE TRIGGER ALL;

--
-- Data for Name: land_use_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE land_use_type DISABLE TRIGGER ALL;

INSERT INTO land_use_type (code, display_value, description, status) VALUES ('forestry', 'Forestry::::::::::::::::ሥነ-ደን', 'The land is part of a forest::::::::::::::::መሬቱ የደን አካል ነው', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('nationalPark', 'National Park::::::::::::::::ብሔራዊ ፓርክ', 'The land is used for a national park.::::::::::::::::መሬቱ ጥቅም ላይ የዋለው ለብሄራዊ ፓርክነት ነው', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('foreshore', 'Foreshore::::::::::::::::የውኃ ዳርቻ', 'The foreshore of water bodies such as seas, lakes and rivers.::::::::::::::::እንደ ባህር፤ ኃይቆችና ወንዞች ያሉ የውኃ አካላት ዳርቻ', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('riverBed', 'River bed::::::::::::::::የወንዝ ወለል', 'The land is part of a river bed.::::::::::::::::መሬቱ የወንዝ ወለል አካል ነው', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('commercial', 'Commercial::::Коммерческая::::تجاري::::Commercial::::የንግድ', '', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('cemetery', 'Cemetery::::::::::::::::መካነ-መቃብር', 'The land is used for a cemetery or burial ground.::::::::::::::::መሬቱ ጥቅም ላይ የዋለው ለመካነ-መቃብርነት ወይም ለጥንት የመቃብር ቦታነት ነው', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('utility', 'Utility::::::::::::::::አገልግሎት ', 'The land is used for a utility such as a power substation, dam, water treatment plant, etc.::::::::::::::::መሬቱ ጥቅም ላይ የዋለው እንደ የኃይል ንዑስ ጣቢያነት፤ ግድብ፤ የውኃ ማጣሪያ ጣቢያ ላለ አገልግሎት ነው', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('residential', 'Residential::::Жилая::::سكني::::Résidentiel::::የመኖሪያ', '', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('marginalStrip', 'Marginal Strip::::::::::::::::የውሀ አካል ጠርዝ ላይ የሚገኝ ቀጠን ብሎ ረጅም መሬት', 'The land extending along the landward margins of the foreshore and other water bodies.::::::::::::::::በውኃ ዳርቻዎች የተዘረጋ መሬት', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('hospital', 'Hospital::::::::::::::::ሆስፒታል', 'The land is part of a hospital::::::::::::::::መሬቱ የሆስፒታል አካል ነው', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('greenZone', 'Green Zone::::::::::::::::አረንጓዴ ዞን', 'The land is designated as a green zone between developed and less developed or undeveloped areas.::::::::::::::::መሬቱ የተመደበው በአረንጓጥዴ ቀጠናነት ነው፤ የሚገኘውም በለሙ እና አነስተኛ በለሙ ወይንም ባለሙ አካባቢዎች መካከል ነው', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('mining', 'Mining::::::::::::::::ማዕድን ማውጣት', 'The land is used for a mine::::::::::::::::መሬቱ ጥቅም ላይ የዋለው ለማዕድን ማውጫነት ነው', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('industrial', 'Industrial::::Производственная::::صناعي::::Industriel::::የኢንዳስትሪ', '', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('transport', 'Transportation::::::::::::::::መጓጓዣ', 'The land is used as a transportation hub such as a bus stop, railway station or ferry terminal.::::::::::::::::መሬቱ ጥቅም ላይ የዋለው እንደ የአውቶቡስ መናሀሪያ፤ የባቡር ጣቢያ እና ጀልባ መዳረሻ ያሉ መጓጓዣ ማዕከልነት ነው', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('military', 'Military::::::::::::::::የጦር', 'The land is used for a militry base or other military installation.::::::::::::::::መሬቱ ጥቅም ላይ የዋለው ለጦር ሰፈርነት ወይም ለጦር መሣሪያዎች ተከላ ነው', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('marineReserve', 'Marine Reserve::::::::::::::::የባሕር ጥብቅ ቦታ', 'The land is used for a marine reserve::::::::::::::::መሬቱ ጥቅም ላይ የዋለው ለባሕር ጥብቅ ቦታነት ነው', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('building', 'Building::::::::::::::::ሕንጻ', 'The land is used for a public or commerical building::::::::::::::::መሬቱ ጥቅም የዋለው ለህዝብ ወይም ንግድ ሕንጻነት ነው', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('educational', 'Educational::::::::::::::::የትምህርት', 'The land is used for an educational facility such as a school, university or training institution.::::::::::::::::መሬቱ ጥቅም ላይ የዋለው እንደ ትምህርት ቤት፤ ዩኒቨርሲቲ ወይም የማሰልጠኛ ተቋም ላለ የትምህርት አገልግሎት ነው', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('wharf', 'Wharf, Ramp or Jetty::::::::::::::::የመርከብ ወይም የጀልባ ማረፊያ፡ ማንሻ፤ ማውረጃ፤ መጠለያ፤ ሰገነት   ', 'The land has a wharf, boat ramp or jetty erected on it.::::::::::::::::መሬቱ የመርከብ ወይም የጀልባ ማረፊያ፤ ማንሻና መውረጃ፤ መጠለያ/ ሰገነት ተሰርቶለታል', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('seabed', 'Seabed::::::::::::::::Seabed', 'The land is seabed.::::::::::::::::መሬቱ የውቂያኖስ ወለል አካል ነው', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('road', 'Road::::::::::::::::መንገድ', 'The land is used for roading.::::::::::::::::መሬቱ ለመንገድነት ያገለግላል', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('regionalPark', 'Regional Park::::::::::::::::ክልላዊ ፓርክ', 'The land is used for a regional park.::::::::::::::::መሬቱ ጥቅም ላይ የዋለው ለክልላዊ ፓርክነት ነው', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('pastoral', 'Pastoral::::::::::::::::የግጦሽ መሬት ', 'The land is pastoral land::::::::::::::::መሬቱ የግጦሽ ነው', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('park', 'Park or Playground::::::::::::::::መጫወቻ ቦታ', 'The land is used for a local park, playground or local reserve.::::::::::::::::መሬቱ ጥቅም ላይ የዋለው ለአካባቢ ፓርክነት፤ መዝናኛ ቦታነት ወይም አካባቢያዊ ጥብቅ ቦታነት ነው', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('accessway', 'Accessway::::::::::::::::የመተላለፊያ መንገድ', 'The land is used for public access::::::::::::::::መሬቱ ለህዝብ መጠቀሚያነት ያገለግላል', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('agricultural', 'Agricultural::::Сельскохозяйственная::::زراعي::::Agricole::::የግብርና', '', 'c');


ALTER TABLE land_use_type ENABLE TRIGGER ALL;

--
-- Data for Name: level_content_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE level_content_type DISABLE TRIGGER ALL;

INSERT INTO level_content_type (code, display_value, description, status) VALUES ('geographicLocator', 'Geographic Locators::::Географические Точки::::تحديد المواقع الجغرافية::::Repères Géographiques::::የጂኦግራፊ ጠቋሚዎች', 'Extension to LADM::::Расширение LADM::::Extension to LADM::::Extension au LADM::::ወደ መአዶሞ ማስፋት', 'c');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('building', 'Building::::Здание::::بناية::::Bâtiment::::ሕንጻ', '', 'x');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('customary', 'Customary::::Традиционный::::عرفي::::Coutumier::::ልማዳዊ', '', 'x');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('informal', 'Informal::::Неформальный::::غير رسمي::::Informel::::ይፋዊ ያልሆነ', '', 'x');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('mixed', 'Mixed::::Смешанный::::مختلط::::Mixte::::ቅልቅል', '', 'x');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('network', 'Network::::Сеть::::شبكة::::Réseau::::መረብ', '', 'x');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('primaryRight', 'Primary Right::::Первичное право::::حق اساسي::::Droit Principal::::ቀዳማይ መብት', '', 'c');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('responsibility', 'Responsibility::::Ответственность::::المسؤوليات::::Responsibilité::::ኃላፊነት', '', 'x');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('restriction', 'Restriction::::Ограничение::::القيود::::Restriction::::ገደብ', '', 'c');


ALTER TABLE level_content_type ENABLE TRIGGER ALL;

--
-- Data for Name: register_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE register_type DISABLE TRIGGER ALL;

INSERT INTO register_type (code, display_value, description, status) VALUES ('all', 'All::::Все::::الجميع::::Tout::::ሁሉም ', '', 'c');
INSERT INTO register_type (code, display_value, description, status) VALUES ('forest', 'Forest::::Лес::::غابات::::Forêt::::ደን', '', 'c');
INSERT INTO register_type (code, display_value, description, status) VALUES ('mining', 'Mining::::Добыча::::التعدين::::Mine::::ማዕድን ማውጣት', '', 'c');
INSERT INTO register_type (code, display_value, description, status) VALUES ('publicSpace', 'Public Space::::Общественная территория::::اماكن عامة::::Espace Publique::::የሕዝብ አደባባይ (ቦታ)', '', 'c');
INSERT INTO register_type (code, display_value, description, status) VALUES ('rural', 'Rural::::Сельский::::ريفي::::Rural::::የገጠር', '', 'c');
INSERT INTO register_type (code, display_value, description, status) VALUES ('urban', 'Urban::::Городской::::حضري::::Urbain::::የከተማ', '', 'c');


ALTER TABLE register_type ENABLE TRIGGER ALL;

--
-- Data for Name: state_land_status_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE state_land_status_type DISABLE TRIGGER ALL;

INSERT INTO state_land_status_type (code, display_value, description, status) VALUES ('surplus', 'Surplus::::::::::::::::ትርፍ', 'The land is no longer required by the state and can be disposed of.::::::::::::::::መሬቱ በመንግስት አይፈለግም እናም ሊተላለፍ ይችላል', 'c');
INSERT INTO state_land_status_type (code, display_value, description, status) VALUES ('proposed', 'Proposed::::::::::::::::የውሳኔ ሃሳብ ቀረበ', 'The land has been nominated for aquisition by the state.::::::::::::::::መሬቱ መንግስት ሊወስደው ሀሳብ ቀርቦበታል', 'c');
INSERT INTO state_land_status_type (code, display_value, description, status) VALUES ('dormant', 'Dormant::::::::::::::::ጥቅም ላይ ያልዋለ', 'The land is not being used for any purpose (e.g. it has been land banked)::::::::::::::::መሬቱ ለምንም አገልግሎት እየዋለ አይደለም (ምሣሌ የመሬት ባንክ ውስጥ የተካተተ ነው)', 'c');
INSERT INTO state_land_status_type (code, display_value, description, status) VALUES ('disposed', 'Disposed::::::::::::::::ተላልፏል', 'The land has been disposed of and is no longer the responsiblity of the state.::::::::::::::::መሬቱ ተላልፏል እናም የመንግስት ኃላፊነት አይደለም', 'c');
INSERT INTO state_land_status_type (code, display_value, description, status) VALUES ('current', 'Current::::::::::::::::ወቅታዊ', 'The state is currently responsible for managing or maintaining the land::::::::::::::::መንግስት በአሁኑ ሰዓት መሬቱን ለማስተዳደር ወይም ለመንከባከብ ኃላፊነት አለበት', 'c');


ALTER TABLE state_land_status_type ENABLE TRIGGER ALL;

--
-- Data for Name: structure_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE structure_type DISABLE TRIGGER ALL;

INSERT INTO structure_type (code, display_value, description, status) VALUES ('point', 'Point::::Точка::::Point::::Point::::ነጥብ', '', 'c');
INSERT INTO structure_type (code, display_value, description, status) VALUES ('polygon', 'Polygon::::Полигон::::مضلع::::Polygone::::ፖሊጎን', '', 'c');
INSERT INTO structure_type (code, display_value, description, status) VALUES ('sketch', 'Sketch::::Схема::::رسم تخطيطي::::Croquis::::ንድፍ', '', 'c');
INSERT INTO structure_type (code, display_value, description, status) VALUES ('text', 'Text::::Текс::::نص::::Texte::::አጭር የጽሁፍ መልእክት', '', 'c');
INSERT INTO structure_type (code, display_value, description, status) VALUES ('topological', 'Topological::::Топологический::::طبوغرافي::::Topologique::::ቶፖሎጂካል', '', 'c');
INSERT INTO structure_type (code, display_value, description, status) VALUES ('unStructuredLine', 'UnstructuredLine::::Неструктурированная линия::::خط غير منتظم::::Ligne::::አንስትራክቸርድ መስመር', '', 'c');


ALTER TABLE structure_type ENABLE TRIGGER ALL;

--
-- Data for Name: surface_relation_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE surface_relation_type DISABLE TRIGGER ALL;

INSERT INTO surface_relation_type (code, display_value, description, status) VALUES ('above', 'Above::::Над::::فوق::::Au-dessus::::ከላይ', '', 'x');
INSERT INTO surface_relation_type (code, display_value, description, status) VALUES ('below', 'Below::::Под::::أسفل::::En-dessous::::ታች', '', 'x');
INSERT INTO surface_relation_type (code, display_value, description, status) VALUES ('mixed', 'Mixed::::Смешанный::::مختلط::::Mixte::::ቅልቅል', '', 'x');
INSERT INTO surface_relation_type (code, display_value, description, status) VALUES ('onSurface', 'On Surface::::На Поверхности::::فوق السطح::::En Surface::::የላይ ገጽታ', '', 'c');


ALTER TABLE surface_relation_type ENABLE TRIGGER ALL;

--
-- Data for Name: utility_network_status_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE utility_network_status_type DISABLE TRIGGER ALL;

INSERT INTO utility_network_status_type (code, display_value, description, status) VALUES ('inUse', 'In Use::::Используется::::قيد الاستخدام::::Utilisé::::በጥቅም ላይ ', '', 'c');
INSERT INTO utility_network_status_type (code, display_value, description, status) VALUES ('outOfUse', 'Out of Use::::Не используется::::خارج الخدمة::::Hors d''usage::::ጥቅም መስጠት ያቆመ', '', 'c');
INSERT INTO utility_network_status_type (code, display_value, description, status) VALUES ('planned', 'Planned::::Запланировано::::مخطط::::Planifié::::የታቀደ', '', 'c');


ALTER TABLE utility_network_status_type ENABLE TRIGGER ALL;

--
-- Data for Name: utility_network_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE utility_network_type DISABLE TRIGGER ALL;

INSERT INTO utility_network_type (code, display_value, description, status) VALUES ('chemical', 'Chemicals::::Химическая::::كيمياء::::Produits chimiques::::ኬሚካሎች', '', 'c');
INSERT INTO utility_network_type (code, display_value, description, status) VALUES ('electricity', 'Electricity::::Электричество::::كهرباء::::Electricité::::የኤሌክትሪክ ኃይል ', '', 'c');
INSERT INTO utility_network_type (code, display_value, description, status) VALUES ('gas', 'Gas::::Газ::::غاز::::Gaz::::ጋዝ', '', 'c');
INSERT INTO utility_network_type (code, display_value, description, status) VALUES ('heating', 'Heating::::Отопление::::حرارة::::Chauffage::::ማሞቅ', '', 'c');
INSERT INTO utility_network_type (code, display_value, description, status) VALUES ('oil', 'Oil::::Нефть::::بترول::::Pétrol::::ነዳጅ ዘይት', '', 'c');
INSERT INTO utility_network_type (code, display_value, description, status) VALUES ('telecommunication', 'Telecommunication::::Телекоммуникации::::اتصالات::::Télécommunication::::ቴሌኮሙኒኬሽን', '', 'c');
INSERT INTO utility_network_type (code, display_value, description, status) VALUES ('water', 'Water::::Вода::::ماء::::Eau::::ውሃ', '', 'c');


ALTER TABLE utility_network_type ENABLE TRIGGER ALL;

SET search_path = party, pg_catalog;

--
-- Data for Name: communication_type; Type: TABLE DATA; Schema: party; Owner: postgres
--

ALTER TABLE communication_type DISABLE TRIGGER ALL;

INSERT INTO communication_type (code, display_value, status, description) VALUES ('courier', 'Courier::::Курьер::::ساعي بريد::::Coursier::::መልዕክተኛ ', 'c', '...::::::::...::::...::::...');
INSERT INTO communication_type (code, display_value, status, description) VALUES ('fax', 'Fax::::Факс::::فاكس::::Fax::::ፋክስ', 'c', '...::::::::...::::...::::...');
INSERT INTO communication_type (code, display_value, status, description) VALUES ('phone', 'Phone::::Телефон::::تلفون::::Téléphone::::ስልክ', 'c', '...::::::::...::::...::::...');
INSERT INTO communication_type (code, display_value, status, description) VALUES ('post', 'Post::::Почта::::بريد::::Poste::::አስታውቅ (አሳይ)', 'c', '...::::::::...::::...::::...');
INSERT INTO communication_type (code, display_value, status, description) VALUES ('eMail', 'e-Mail::::Эл. почта::::بريد الكتروني::::Courriel::::ኢ-ሜይል', 'c', '...::::::::...::::...::::...');


ALTER TABLE communication_type ENABLE TRIGGER ALL;

--
-- Data for Name: gender_type; Type: TABLE DATA; Schema: party; Owner: postgres
--

ALTER TABLE gender_type DISABLE TRIGGER ALL;

INSERT INTO gender_type (code, display_value, status, description) VALUES ('female', 'Female::::Женский::::أنثى::::Femme::::ሴት', 'c', '...::::::::...::::...::::...');
INSERT INTO gender_type (code, display_value, status, description) VALUES ('male', 'Male::::Мужской::::ذكر::::Homme::::ወንድ ', 'c', '...::::::::...::::...::::...');
INSERT INTO gender_type (code, display_value, status, description) VALUES ('na', 'Not applicable::::::::::::::::አይመለከተውም', 'c', '');


ALTER TABLE gender_type ENABLE TRIGGER ALL;

--
-- Data for Name: group_party_type; Type: TABLE DATA; Schema: party; Owner: postgres
--

ALTER TABLE group_party_type DISABLE TRIGGER ALL;

INSERT INTO group_party_type (code, display_value, status, description) VALUES ('tribe', 'Tribe::::Племя::::القبيلة::::Tribu::::ጎሳ', 'x', '');
INSERT INTO group_party_type (code, display_value, status, description) VALUES ('association', 'Association::::Ассоциация::::رابطة::::Association::::ማሕበር', 'c', '');
INSERT INTO group_party_type (code, display_value, status, description) VALUES ('family', 'Family::::Семья::::العائلة::::Famille::::ቤተሰብ', 'c', '');
INSERT INTO group_party_type (code, display_value, status, description) VALUES ('baunitGroup', 'Basic Administrative Unit Group::::Базовая Административная Группа Единиц::::مجموعة الوحدات الادارية الاساسية::::Groupe d''Unité Administrative de Base::::መሠረታዊ የአስተዳደር አሀድ ስብስብ', 'x', '');


ALTER TABLE group_party_type ENABLE TRIGGER ALL;

--
-- Data for Name: id_type; Type: TABLE DATA; Schema: party; Owner: postgres
--

ALTER TABLE id_type DISABLE TRIGGER ALL;

INSERT INTO id_type (code, display_value, status, description) VALUES ('nationalID', 'National ID::::Внутренний ID::::بطاقة شخصية::::Carte Nationale d''Identité::::ብሔራዊ መታወቂያ', 'c', 'The main person ID that exists in the country::::Внутренняя ID карта гражданина внутри страны::::...::::Le document principal d''identité existant dans le pays::::በሀገር ዉስጥ የሚኖር ዋና ሰው የመታወቂያ ወረቀት');
INSERT INTO id_type (code, display_value, status, description) VALUES ('nationalPassport', 'National Passport::::Паспорт::::جواز سفر::::Passeport National::::ብሔራዊ ፓስፖርት', 'c', 'A passport issued by the country::::Паспорт, выданный в стране::::...::::Un passeport délivré par le pays::::በሀገሪቱ የተሰጠ ፓስፖርት');
INSERT INTO id_type (code, display_value, status, description) VALUES ('otherPassport', 'Other Passport::::Другой паспорт::::جواز سفراخر::::Autre passeport::::ሌላ ፓስፓርት', 'c', 'A passport issued by another country::::Паспорт выданный другой страной::::...::::Un passeport délivré par un autre pays::::በሌላ ሀገር የተሰጠ ፓስፖርት');


ALTER TABLE id_type ENABLE TRIGGER ALL;

--
-- Data for Name: party_role_type; Type: TABLE DATA; Schema: party; Owner: postgres
--

ALTER TABLE party_role_type DISABLE TRIGGER ALL;

INSERT INTO party_role_type (code, display_value, status, description) VALUES ('bank', 'Bank::::Банк::::البنك::::Banque::::ባንክ', 'c', '...::::::::...::::...::::...');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('citizen', 'Citizen::::Гражданин::::المواطن::::Citoyen::::ዜጋ', 'c', '...::::::::...::::...::::...');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('writer', 'Writer::::Оформитель документов::::كاتب::::Auteur::::ዳታ ኢንኮደር', 'x', '...::::::::...::::...::::...');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('conveyor', 'Conveyor::::Перевозчик::::الموصل::::Convoyeur::::ቀያሽ', 'x', '...::::::::...::::...::::...');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('employee', 'Employee::::Служащий::::الموظف::::Employé::::ሰራተኛ', 'x', '...::::::::...::::...::::...');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('farmer', 'Farmer::::Фермер::::مزارع::::Agriculteur::::አርሶ አደር', 'x', '...::::::::...::::...::::...');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('certifiedSurveyor', 'Licenced Surveyor::::Лицензированный Геодезист::::مساح مرخص::::Géomètre Expert / Arpenteur licencié::::ፈቃድ ያለው ቀያሽ', 'c', '...::::::::...::::...::::...');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('team', 'Team::::::::::::::::ቡድን', 'c', 'Extension to LADM for State Land. Identifies the party as being a team. ::::::::::::::::ወደ መአዶሞ ማስፋት ምክንያቱም የመንግስት መሬት ባለጉዳዩን እንደ ቡድን ስለሚለየው ');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('propManager', 'Property Manager::::::::::::::::የንብረት አስተዳዳሪ', 'c', 'Extension to LADM for State Land. Identifies the party as being a property manager. ::::::::::::::::ወደ መአዶሞ ማስፋት ምክንያቱም የመንግስት መሬት ባለጉዳዩን እንደ ንብረት አስተዳዳሪ ስለሚለየው');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('transferor', 'Transferor (from)::::Цедент::::منقول منه::::Cédant (de)::::አስተላላፊ (ከ)', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('landOfficer', 'Land Officer::::Землеустроитель::::موظف دائرة الاراضي::::Officier d''Etat / du Cadastre::::የመሬት ባለስልጣን', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('lodgingAgent', 'Lodging Agent::::Агент по подачи заявлений::::وكيل تسجيل::::Agent des Dépôts::::አቤቱታ አቅራቢ ወኪል', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('powerOfAttorney', 'Power of Attorney::::Адвокат (поверенный)::::وكيل::::Procuration::::ውክልና', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('transferee', 'Transferee (to)::::Получатель::::منقول له::::Cessionnaire (à)::::የተላለፈለት (ለ)', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('moneyProvider', 'Money Provider::::Заемщик денег::::ممول::::Fournisseur d''Argent::::ገንዘብ ሰጪ', 'c', '...::::::::...::::...::::...');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('applicant', 'Applicant::::Заявитель::::مقدم الطلب::::Demandeur::::አመልካች ', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('notary', 'Notary::::Нотариус::::كاتب عدل::::Notaire::::የሰነድ አረጋጋጭ', 'c', '...::::::::...::::...::::...');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('stateAdministrator', 'Registrar / Approving Surveyor::::Регистратор / Утверждающий Геодезист::::مساح معتمد::::Officier d''Etat / Géomètre Approbateur::::ሬጅስትራር/አጽዳቂ ቀያሽ', 'c', '...::::::::...::::...::::...');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('surveyor', 'Surveyor::::Геодезист::::مساح::::Géomètre::::ቀያሽ', 'x', '...::::::::...::::...::::...');


ALTER TABLE party_role_type ENABLE TRIGGER ALL;

--
-- Data for Name: party_type; Type: TABLE DATA; Schema: party; Owner: postgres
--

ALTER TABLE party_type DISABLE TRIGGER ALL;

INSERT INTO party_type (code, display_value, status, description) VALUES ('baunit', 'Basic Administrative Unit::::Базовая Административная Единица::::الطابو::::Unité Administrative de Base::::መሠረታዊ የአስተዳደር አሀድ ', 'c', '...::::::::...::::...::::...');
INSERT INTO party_type (code, display_value, status, description) VALUES ('group', 'Group::::Группа::::مجموعة::::Groupe::::ስብስብ', 't', '...::::::::...::::...::::...');
INSERT INTO party_type (code, display_value, status, description) VALUES ('naturalPerson', 'Natural Person::::Физическое лицо::::شخص طبيعي::::Personne Physique::::የተፈጥሮ ሰው', 'c', '...::::::::...::::...::::...');
INSERT INTO party_type (code, display_value, status, description) VALUES ('nonNaturalPerson', 'Non-natural Person::::Организация::::شخص اعتباري::::Personne Non Physique::::የተፈጥሮ ሰው ያልሆነ', 'c', '...::::::::...::::...::::...');


ALTER TABLE party_type ENABLE TRIGGER ALL;

SET search_path = source, pg_catalog;

--
-- Data for Name: administrative_source_type; Type: TABLE DATA; Schema: source; Owner: postgres
--

ALTER TABLE administrative_source_type DISABLE TRIGGER ALL;

INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('valuation', 'Valuation', 'c', 'Extension to LADM', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('notice', 'Notice', 'c', 'Extension to LADM', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('contractForSale', 'Contract for Sale::::Договор о Продаже::::عقد بيع::::Contrat de Vente::::የሽያጭ ውል', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('deed', 'Deed::::Сделка::::عمل::::Acte::::የንብረት ማስተላለፊያ ሰነድ ', 'c', '...::::::::...::::...::::...', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('jpg', 'Jpg Scanned Document::::Отсканированный Документ JPEG::::وثيقة Jpg ممسوحة::::Document Scanné en JPG::::ጄፒጂ ስካንድ ሰነድ', 'x', '...::::::::...::::...::::...', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('will', 'Will::::Завещание::::وصية::::Testament::::ኑዛዜ', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('objection', 'Objection::::::::::::::::የተቃውሞ ሰነድ', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('pdf', 'Pdf Scanned Document::::Отсканированный Документ PDF::::وثيقة Pdf ممسوحة::::Document Scanné en PDF::::ፒዲፍ ስካንድ ሰነድ', 'x', '...::::::::...::::...::::...', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('caveat', 'Caveat::::Протест::::الموانع::::Caveat::::የእክል ማስጠንቀቂያ', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('tiff', 'Tiff Scanned Document::::Отсканированный Документ TIFF::::وثيقة ممسوحة (Tiff)::::Document Scanné en TIFF::::ቲ ኤፍ ኤፍ ስካንድ ሰነድ', 'x', '...::::::::::::...::::...', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('mortgage', 'Mortgage::::Ипотека::::رهن::::Hypothèque::::ዋስትና', 'c', '...::::::::...::::...::::...', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('lease', 'Lease::::Договор Аренды::::تأجير::::Bail::::ሊዝ', 'c', '...::::::::...::::...::::...', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('agriLease', 'Agricultural Lease::::Сельскохозяйственная Аренда::::اجارة زراعية::::Bail Agricole::::የግብርና ሊዝ', 'x', '...::::::::::::...::::...', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('agriConsent', 'Agricultural Consent::::Сельскохозяйственное Разрешение::::الموافقة الزراعية::::Consentement Agricole::::የግብርና ፈቃድ', 'x', '...::::::::...::::...::::...', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('agriNotaryStatement', 'Agricultural Notary Statement::::Нотариальное Сельскохозяйственное Заявление::::بيان كاتب العدل الزراعية::::Déclaration Agricole Notariée::::የግብርና አረጋጋጭ ቃል', 'x', '...::::::::...::::...::::...', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('waiver', 'Waiver to Caveat or other requirement::::Ходатайство о приостановке судебного разбирательства::::تنازل  عن قيد  أو شرط آخر::::Dispense d''Opposition / Caveat ou autre condition::::የእክል ማስጠንቀቂያን መተው ወይም ሌላ መሟላት ያለበት ጉዳይ', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('cadastralSurvey', 'Cadastral Survey::::Кадастровая Съемка::::مسح الاراضي::::Relevé Cadastral::::ካዳሰተር ቅየሳ', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('standardDocument', 'Standard Document::::Стандартный Документ::::وثيقة مرجعية::::Document Standard::::እስታንዳርድ ሰነድ', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት', true);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('idVerification', 'Proof of Identity::::::::::::::::የግል መታወቂያ ወረቀትን ጨምሮ የመለያ ዓይነት', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('cadastralMap', 'Cadastral Map::::Кадастровая Карта::::خارطة المساحة::::Plan Cadastral::::ካዳሰተር ካርታ', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('powerOfAttorney', 'Power of Attorney::::Доверенность::::وكالة::::Procuration::::ውክልና', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት', true);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('proclamation', 'Proclamation::::Прокламация::::إعلان::::Proclamation::::አዋጅ', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('systematicRegn', 'Systematic Registration Application::::Заявление на Системную Регистрацию::::طلب تسجيل منتظم::::Demande Enregistrement Systématique::::አጠቃላይ የምዝገባ ማመልከቻ', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('publicNotification', 'Public Notification::::::::::::::::ለአጠቃላይ ምዝገባ የሕዝብ ማስታወቂያ', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('courtOrder', 'Court Order::::Судебное Решение::::امر محكمة::::Décision de Justice::::የፍርድ ቤት ትእዛዝ ', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('agreement', 'Agreement::::Соглашение::::اتفاقية::::Accord::::ስምምነት', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM::::ወደ መአዶሞ ማስፋት', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('title', 'Title::::Право Собственности::::سند ملكية::::Titre::::የይዞታ መብት ማረጋገጫ ሰነድ', 'c', '...::::::::...::::...::::...', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('tif', 'Tif Scanned Document::::Отсканированный Документ TIF::::وثيقة Tif  ممسوحة.::::Document Scanné en TIF::::ቲ ኤፍ ስካንድ ሰነድ', 'x', '...::::::::...::::...::::...', false);


ALTER TABLE administrative_source_type ENABLE TRIGGER ALL;

--
-- Data for Name: availability_status_type; Type: TABLE DATA; Schema: source; Owner: postgres
--

ALTER TABLE availability_status_type DISABLE TRIGGER ALL;

INSERT INTO availability_status_type (code, display_value, status, description) VALUES ('available', 'Available::::Доступный::::متوفرة::::Disponible::::የሚገኝ', 'c', 'Extension to LADM::::Extension to LADM::::Extension to LADM::::Extension au LADM::::ወደ መአዶሞ ማስፋት');
INSERT INTO availability_status_type (code, display_value, status, description) VALUES ('archiveConverted', 'Converted::::Сконвертированный::::محولة::::Converti::::ተለውጧል ', 'c', '');
INSERT INTO availability_status_type (code, display_value, status, description) VALUES ('archiveDestroyed', 'Destroyed::::Уничтоженный::::متلفة::::Détruit::::ተደምስሷል', 'x', '');
INSERT INTO availability_status_type (code, display_value, status, description) VALUES ('incomplete', 'Incomplete::::Незаконченный::::غير مكتملة::::Incomplet::::ያልተሟላ', 'c', '');
INSERT INTO availability_status_type (code, display_value, status, description) VALUES ('archiveUnknown', 'Unknown::::Неизвестный::::غير معروفة::::Inconnu::::አይታወቅም', 'c', '');


ALTER TABLE availability_status_type ENABLE TRIGGER ALL;

--
-- Data for Name: presentation_form_type; Type: TABLE DATA; Schema: source; Owner: postgres
--

ALTER TABLE presentation_form_type DISABLE TRIGGER ALL;

INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('modelDigital', 'Digital Model::::Цифровая Модель::::نموذج رقمي::::Modèle Numérique::::ዲጂታል - ሞዴል', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('modelHarcopy', 'Hardcopy Model::::Бумажная Модель::::نموذج ورقي::::Modèle Papier::::ሀርድ ቅጂ ሞዴል', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('profileDigital', 'Digital Profile::::Цифровое Дело::::ملف شخصي رقمي::::Profil Numérique::::ዲጂታል - ፕሮፋይል (መግለጫ)', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('documentDigital', 'Digital Document::::Цифровой Документ::::وثيقة رقمية::::Document Numérique::::ዲጂታል - ሰነድ', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('profileHardcopy', 'Hardcopy Profile::::Бумажное Дело::::ملف شخصي ورقي::::Profil Papier::::ሀርድ ቅጂ ፕሮፋይል (መግለጫ)', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('documentHardcopy', 'Hardcopy Document::::Бумажный Документ::::وثيقة ورقية::::Document Papier::::ሀርድ ቅጂ ሰነድ', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('imageDigital', 'Digital Image::::Цифровое Изображение::::صورة رقمية::::Image Numérique::::ዲጂታል - ምስል', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('tableDigital', 'Digital Table::::Цифровая Таблица::::جدول رقمي::::Table Numérique::::ዲጂታል - ሰነጠረዥ', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('imageHardcopy', 'Hardcopy Image::::Бумажное Изображение::::صورة ورقية::::Image Papier::::ሀርድ ቅጂ ምስል', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('mapDigital', 'Digital Map::::Цифровая Карты::::خارطة رقمية::::Plan Numérique::::ዲጂታል - ካርታ', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('tableHardcopy', 'Hardcopy Table::::Бумажная Таблица::::جدول ورقي::::Table Papier::::ሀርድ ቅጂ ሠንጠረዥ', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('mapHardcopy', 'Hardcopy Map::::Бумажная Карта::::خارطة ورقية::::Plan Papier::::ሀርድ ቅጂ ካርታ', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('videoDigital', 'Digital Video::::Цифровое Видео::::شريط فيديو رقمي::::Vidéo Numérique::::ዲጂታል - ቪዲዮ', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('videoHardcopy', 'Hardcopy Video::::Видео на носителе::::شريط فيديو::::Vidéo Analogue::::ሀርድ ቅጂ ቪዲዮ', 'c', '');


ALTER TABLE presentation_form_type ENABLE TRIGGER ALL;

--
-- Data for Name: spatial_source_type; Type: TABLE DATA; Schema: source; Owner: postgres
--

ALTER TABLE spatial_source_type DISABLE TRIGGER ALL;

INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('surveyData', 'Survey Data (Coordinates)::::Данные Съемки (Координаты)::::احداثيات المسح::::Données de Levé (Coordonnées)::::የቅየሳ መረጃ (ኮኦርዲኔቶች)', 'c', 'Extension to LADM::::Расширение LADM::::Extension to LADM::::Extension au LADM::::ወደ መአዶሞ ማስፋት');
INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('cadastralSurvey', 'Cadastral Survey::::Кадастровая Съемка::::المسح::::Levé Cadastral::::ካዳሰተር ቅየሳ', 'c', 'Extension to LADM::::Расширение LADM::::Extension to LADM::::Extension au LADM::::ወደ መአዶሞ ማስፋት');
INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('fieldSketch', 'Field Sketch::::Полевая Схема::::رسم الحقل::::Croquis de terrain::::የመስክ ንድፍ', 'c', '');
INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('gnssSurvey', 'GNSS (GPS) Survey::::Съемка GNSS (GPS)::::مسح جي بي اس::::Levé GNSS (GPS)::::ጂ ኤን ኤስ ኤስ (ጂፒኤስ) ቅየሳ', 'c', '');
INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('orthoPhoto', 'Orthophoto::::Аэрофотография::::الصور الجوية المعدلة::::Orthophoto::::ሌላ ኦርቶፎቶ', 'c', '');
INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('relativeMeasurement', 'Relative Measurements::::Относительные Измерения::::القياسات المرتبطة::::Mesures Relatives::::አንጻራዊ መለኪያዎች', 'c', '');
INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('topoMap', 'Topographical Map::::Топологическая Карта::::خارطة طبوغرافية::::Plan Topographique::::የቶፖግራፊ ካርታ', 'c', '');
INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('video', 'Video::::Видео::::شريط فيديو::::Vidéo::::ቪዲዮ', 'c', '');


ALTER TABLE spatial_source_type ENABLE TRIGGER ALL;

SET search_path = system, pg_catalog;

--
-- Data for Name: approle; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE approle DISABLE TRIGGER ALL;

INSERT INTO approle (code, display_value, status, description) VALUES ('slLeaseCancel', 'Service - Cancel Lease', 'c', 'State Land Service. Allows the Cancel Lease task to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('newOwnership', 'Service - Chance of Ownership::::Service - Chance of Ownership::::الخدمة-تغيير اصحاب الملكية::::Service - Changement de Propriétaire::::የአገልግሎት - የባለሀብትነት ለውጥ', 'c', 'Registration Service. Allows the Change of Ownership service to be started. ::::Registration Service. Allows the Change of Ownership service to be started.::::Registration Service. Allows the Change of Ownership service to be started.::::Service Enregistrement. Permet au Service - Changement de Propriétaire de commencer.::::የምዝገባ አገልግሎት - የባለሀብትነት ለውጥ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('slObjection', 'Service - Manage Objections::::::::::::::::የአገልግሎት - ተቃዉሞዎችን  አስተዳደር', 'c', 'State Land Service. Allows the Manage Objections service to be started.::::::::::::::::የመንግስት መሬት አገልግሎት፤ ተቃውሞችን የማስተዳደር አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('RHSave', 'Party - Save Rightholder::::Party - Save Rightholder::::الطرف-حفظ صاحب حق::::Partie - Sauvegarder Détenteur de Droits::::ባለጉዳይ - ባለመብቱ አቆይ', 'c', 'Allows parties that are rightholders to be edited and saved.::::Allows parties that are rightholders to be edited and saved.::::Allows parties that are rightholders to be edited and saved.::::Permet d''éditer et de sauvegarder le(s) détenteur(s) de droits.::::የባለመብት ባለጉዳዮችን ዝርዝር ጉዳዮች ለማርትዕ እና ለማቆየት ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnUnassignOthers', 'Application - Unassign from Others::::Application - Unassign from Others::::طلب-الغاء التعيين::::Demande - Non assignation aux autres::::ማመልከቻ - ከሌሎች ውሰድ', 'c', 'Allows the user to unassign an application from any user. ::::Allows the user to unassign an application from any user.::::Allows the user to unassign an application from any user.::::Permet à l''utilisateur de retirer une demande à un autre utilisateur.::::ተጠቃሚው ማመልከቻ ከሌላ ተጠቃሚ እንዲወስድ ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('newDigitalTitle', 'Service - Convert Title::::Service - Convert Title::::الخدمة-تحويل ملكية::::Service - Convertir Titre::::የአገልግሎት - ባለሀብትነት ለውጥ', 'c', 'Registration Service. Allows the Convert Title service to be started. ::::Registration Service. Allows the Convert Title service to be started.::::Registration Service. Allows the Convert Title service to be started.::::Service Enregistrement. Permet au Service - Convertir Titre de commencer.::::የምዝገባ አገልግሎት - የይዞታ መብት ማረጋገጫ ሰነድ ለውጥ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ParcelSave', 'Parcel - Edit & Save::::Parcel - Edit & Save::::القطع-تعديل و حفظ::::Parcelle - Editer & Sauvegarder::::ቁራሽ መሬት - አርትዕ እና አቆይ', 'c', 'Allows parcel details to be edited and saved.::::Allows parcel details to be edited and saved.::::Allows parcel details to be edited and saved.::::Permet d''éditer et sauvegarder les détails de la parcelle.::::የቁራሽ መሬት ዝርዝር ጉዳዩችን ለማርትዕ እና ለማቆየት ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('SourceSave', 'Document - Save::::Document - Save::::الوثائق-حفظ::::Document - Sauvegarder::::ሰነድ - አቆይ', 'c', 'Allows document details to be edited and saved::::Allows document details to be edited and saved::::Allows document details to be edited and saved::::Permet d''éditer et sauvegarder les détails de documents.::::የሰነድ ዝርዝር ጉዳዮችን ለማርትዕ እና ለማቆየት ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('RightsExport', 'Reporting - Rights Export::::Reporting - Rights Export::::التقارير- تصدير الحقوق::::Reporting - Export Droits::::ዘገባ- መብቶች ኤክስፖርት', 'c', 'Allows user to export rights informaiton into CSV format.  ::::Allows user to export rights informaiton into CSV format.::::Allows user to export rights informaiton into CSV format.::::Permet à l''utilisateur d''exporter les informations des droits au format CSV.::::ተጠቃሚዎች ስለመብቶች መረጃ ወደ ሲኤስቪ ፎርማት ኤክስፖርት ለማድረግ ይፈቅድላቸዋል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnEdit', 'Application - Edit & Save::::Application - Edit & Save::::حركة طلب- تعديل وحفظ::::Demande - Edit & Save::::ማመልከቻ - አርትዕ እና አቆይ', 'c', 'Allows application details to be edited and saved. ::::Allows application details to be edited and saved.::::Allows application details to be edited and saved.::::Permet d''éditer et sauvegarder les détails de la demande.::::የማመልከቻ ዝርዝር ጉዳዮችን ለማርትዕ እና ለማቆየት ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('BaunitSave', 'Property - Edit & Save::::Property - Edit & Save::::الملكية-تعديل وحفظ::::Propriété - Editer & Sauvegarder::::ንብረት - አርትዕ እና አቆይ', 'c', 'Allows property details to be edited and saved.::::Allows property details to be edited and saved.::::Allows property details to be edited and saved.::::Permet d''éditer et sauvegarder les détails de la propriété.::::የንብረት ዝርዝር ጉዳዮችን ለማርትዕ እና ለማቆየት ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnUnassignSelf', 'Application - Unassign from Self::::Application - Unassign from Self::::طلب-الغاء التعيين الذاتي::::Demande - Auto non assignation::::ማመልከቻ - ከራስ ውሰድ', 'c', 'Allows a user to unassign an application from themselves. ::::Allows a user to unassign an application from themselves.::::Allows a user to unassign an application from themselves.::::Permet à l''utilisateur de s''auto-retirer une demande.::::ተጠቅሚ ማመልከቻ ከራሱ እንዲወስድ ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('SourceSearch', 'Document - Search & View::::Document - Search & View::::الوثائق- البحث والعرض::::Document - Rechercher & Visualiser::::ሰነድ - ፈልግ እና ተመልከት', 'c', 'Allows users to search for documents.::::Allows users to search for documents.::::Allows users to search for documents.::::Permet à l''utilisateur de rechercher et visualiser des documents.::::ተጠቃሚዎች ሰነዶች እነዲፈልጉ ይፈቅድላቸዋል');
INSERT INTO approle (code, display_value, status, description) VALUES ('servitude', 'Service - Register Servitude::::Service - Register Servitude::::الخدمة-تسجيل حق انتفاع::::Service - Enregistrement de Servitude::::የአገልግሎት - የንብረት አገልግሎት መዝግብ ', 'c', 'Registration Service. Allows the Register Servitude service to be started. ::::Registration Service. Allows the Register Servitude service to be started.::::Registration Service. Allows the Register Servitude service to be started.::::Service Enregistrement. Permet au Service - Enregistrement de Servitude de commencer.::::የምዝገባ አገልግሎት - የንብረት አገልግሎት መዝግብ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('slNegotiate', 'Service - Manage Negotiations::::::::::::::::የአገልግሎት - ድርድሮችን አስተዳደር', 'c', 'State Land Service. Allows the Manage Negotiations service to be started.::::::::::::::::የመንግስት መሬት አገልግሎት፤ ድርድሮችን የማስተዳደር አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('serviceEnquiry', 'Service - Service Enquiry::::Service - Service Enquiry::::الخدمة-الاستفسار عن خدمة::::Service - Service Enquête::::የአገልግሎት - የመረጃ አገልግሎት ጥያቄ', 'c', 'Supporting Service. Allow the Service Enquiry service to be started.::::Supporting Service. Allow the Service Enquiry service to be started.::::Supporting Service. Allow the Service Enquiry service to be started.::::Service Soutien. Permet au Service - Service Enquête de commencer.::::ደጋፊ አገልግሎት፤ የመረጃ ፍለጋ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('mortgage', 'Service - Register Mortgage::::Service - Register Mortgage::::الخدمة-تسجيل رهن::::Service - Enregistrement d''une Hypothèque::::የአገልግሎት - ዋስትና መዝግብ', 'c', 'Registration Service. Allows the Register Mortgage service to be started. ::::Registration Service. Allows the Register Mortgage service to be started.::::Registration Service. Allows the Register Mortgage service to be started.::::Service Enregistrement. Permet au Service - Enregistrement d''une Hypothèque de commencer.::::የምዝገባ አገልግሎት - የዋስትና መዝግብ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('registerLease', 'Service - Register Lease::::Service - Register Lease::::الخدمة-تسجيل ايجار::::Service - Enregistrement Bail::::የአገልግሎት - ሊዝ መዝግብ', 'c', 'Registration Service. Allows the Register Lease service to be started. ::::Registration Service. Allows the Register Lease service to be started.::::Registration Service. Allows the Register Lease service to be started.::::Service Enregistrement. Permet au Service - Enregistrement Bail de commencer.::::የምዝገባ አገልግሎት - የሊዝ መዝግብ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('newFreehold', 'Service - Freehold Title::::Service - Freehold Title::::الخدمة-سند ملكية::::Service - Titre de Propriété::::Service - Freehold Title', 'c', 'Registration Service. Allows the Freehold Title service to be started.::::Registration Service. Allows the Freehold Title service to be started.::::Registration Service. Allows the Freehold Title service to be started.::::Service Enregistrement. Permet au Service - Titre de Propriété de commencer.::::Registration Service. Allows the Freehold Title service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('SourcePrint', 'Document - Print::::Document - Print::::الوثائق-طباعة::::Document - Imprimer::::ሰነድ ፕሪንት', 'c', 'Allows users to print documents directly from SOLA. ::::Allows users to print documents directly from SOLA.::::Allows users to print documents directly from SOLA.::::Permet à l''utilisateur d''imprimer des documents directement depuis SOLA.::::ተጠቃሚዎች ሰነዶች በቀጥታ ከኤስኦኤልኤ ፕሪንት እንዲያደርጉ ይፈቅድላቸዋል');
INSERT INTO approle (code, display_value, status, description) VALUES ('removeRestriction', 'Service - Remove Restriction::::Service - Remove Restriction::::الخدمة-ازالة قيد::::Service - Supprimer Restriction::::የአገልግሎት - ገደብ አስወግድ', 'c', 'Registration Service. Allows the Remove Restriction service to be started. ::::Registration Service. Allows the Remove Restriction service to be started.::::Registration Service. Allows the Remove Restriction service to be started.::::Service Enregistrement. Permet au Service - Supprimer Restriction de commencer.::::የምዝገባ አገልግሎት - የገደብ አስወግድ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ViewMap', 'Map - View::::Map - View::::الخارطة- عرض::::Plan - Visualiser::::ካርታ ተመልከት', 'c', 'Allows the user to view the map. ::::Allows the user to view the map.::::Allows the user to view the map.::::Permet à l''utilisateur de visualizer le plan.::::ተጠቃሚው ካርታውን ለማየት ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ExportMap', 'Map - KML Export::::Map - KML Export::::الخارطة-تصدير ل KML::::Plan - Export KML::::ካርታ ኬኤምኤል ኤክስፖርት', 'c', 'Allows the user to export selected features from the map as KML.::::Allows the user to export selected features from the map as KML.::::Allows the user to export selected features from the map as KML.::::Permet à l''utilisateur d''exporter les éléments sélectionnés dans le plan au format KML.::::ተጠቃሚውን ከካርታው የተመረጡ ገጽታዎችን እንደ ኬኤምኤል ኤክስፖርት ለማድረግ ይጠቅማል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnCreate', 'Application - Lodge::::Application - Lodge::::جركة طلب-ايداع::::Demande - Déposer::::ማመልከቻ - አቅርብ', 'c', 'Allows new application details to be created (lodged). ::::Allows new application details to be created (lodged).::::Allows new application details to be created (lodged).::::Permet de créer les détails de la nouvelle demande (déposé).::::የአዲስ ማመልከቻ ዝርዝር ጉዳዮችን ለማቋቋም (ለማስገባት) ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('PartySearch', 'Party - Search & View::::Party - Search & View::::الطرف-البحث والعرض::::Partie - Rechercher & Visualiser::::ባለጉዳይ - ፈልግ እና ተመልከት', 'c', 'Allows user to search and view party details.::::Allows user to search and view party details.::::Allows user to search and view party details.::::Permet à l''utilisateur de rechercher et visualiser les détails d''une partie.::::ተጠቃሚዎች የባለጉዳይ ዝርዝር መረጃ ለመፈለግ እና ለማየት ይፈቅድላቸዋል');
INSERT INTO approle (code, display_value, status, description) VALUES ('BaunitSearch', 'Property - Search::::Property - Search::::الملكية- البحث::::Propriété - Recherche::::ንብረት ፍለጋ ', 'c', 'Allows users to search for properties. ::::Allows users to search for properties.::::Allows users to search for properties.::::Permet à l''utilisateur de rechercher une propriété.::::ተጠቃሚዎች ንብረቶች እነዲፈልጉ ይፈቅድላቸዋል');
INSERT INTO approle (code, display_value, status, description) VALUES ('slLease', 'Service - Record Lease', 'c', 'State Land Service. Allows the Record Lease task to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('CancelService', 'Service Action - Cancel::::Service Action - Cancel::::حركة خدمة-الغاء::::Action Service - Annuler::::የአገልግሎት ድርጊት - ሰርዝ', 'c', 'Allows any service to be cancelled.::::Allows any service to be cancelled.::::Allows any service to be cancelled.::::Permet à n''importe quel service d''être annulé.::::ማንኛውም አገልግሎት እንዲሰረዝ ይፍቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnAssignOthers', 'Application - Assign to Other Users::::Application - Assign to Other Users::::جركة طلب- تعيين لمستحدمين اخرين::::Demande - Assignation à un autre::::ማመልከቻ - ለሌሎች መድብ', 'c', 'Allows a user to assign an application to any other user in the same security groups they are in. ::::Allows a user to assign an application to any other user in the same security groups they are in.::::Allows a user to assign an application to any other user in the same security groups they are in.::::Permet à l''utilisateur d''assigner une demande à n''importe quel autre utilisateur du même group de sécurité.::::ተጠቃሚው በራሱ የደህንነት ስብስቦች ውስጥ ላለ ሌላ ማንኛውም ተጠቃሚ ማመልከቻ ለመመደብ ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('BaunitTeam', 'Property - Assign Team::::::::::::::::ንብረት - ቡድን መድብ', 'c', 'Allows the user to assign a team (e.g. Property Manager) to a property.::::::::::::::::ተጠቃሚውን ለአንድ ንብረት ቡድን ለመመደብ (ምሳሌ የንብረት አስተዳደር) ይጠቅማል');
INSERT INTO approle (code, display_value, status, description) VALUES ('varyMortgage', 'Service - Vary Mortgage::::Service - Vary Mortgage::::الخدمة-تغيير رهن::::Service - Varier Hypothèque::::የአገልግሎት - ዋስትና አሻሽል', 'c', 'Registration Service. Allows the Vary Mortgage service to be started.::::Registration Service. Allows the Vary Mortgage service to be started.::::Registration Service. Allows the Vary Mortgage service to be started.::::Service Enregistrement. Permet au Service - Varier Hypothèque de commencer.::::የምዝገባ አገልግሎት - የዋስትና አሻሻል አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('varyCaveat', 'Service - Vary Caveat::::Service - Vary Caveat::::الخدمة-تغيير مانع::::Service - Varier Caveat::::የአገልግሎት - የእክል ማስጠንቀቂያ አሻሽል', 'c', 'Registration Service. Allows the Vary Caveat service to be started. ::::Registration Service. Allows the Vary Caveat service to be started.::::Registration Service. Allows the Vary Caveat service to be started.::::Service Enregistrement. Permet au Service - Varier Caveat de commencer.::::የምዝገባ አገልግሎት - የእክል ማስጠንቀቂያ አሻሻል አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('caveat', 'Service - Register Caveat::::Service - Register Caveat::::الخدمة-تسجيل مانع::::Service - Enregistrement Caveat::::የአገልግሎት - የእክል ማስጠንቀቂያ መዝገብ', 'c', 'Registration Service. Allows the Register Caveat service to be started. ::::Registration Service. Allows the Register Caveat service to be started.::::Registration Service. Allows the Register Caveat service to be started.::::Service Enregistrement. Permet au Service - Enregistrement Caveat de commencer.::::የምዝገባ አገልግሎት - የእክል ማስጠንቀቂያ መዝግብ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnReject', 'Appln Action - Cancel::::Appln Action - Cancel::::Appln Action - Cancel::::Action Demande - Annuler::::ማመልከቻ ተግባር - ሰርዝ', 'c', 'Required to perform the Cancel applicaiton action. The Cancel action transitions the application into the Annulled state.  ::::Required to perform the Cancel applicaiton action. The Cancel action transitions the application into the Annulled state.::::Required to perform the Cancel applicaiton action. The Cancel action transitions the application into the Annulled state.::::Requis pour pouvoir effectuer l''action d''annulation de la demande. L''action d''annulation transforme le statut de la demande en "Annulé".::::የማመልከቻ ሰርዝ ተግባር እንዲፈጽም ይገደዳል፤ የሰርዝ ተግባር ማመልከቻውን ወደ ፈራሽነት ደረጃ ያሸጋግረዋል');
INSERT INTO approle (code, display_value, status, description) VALUES ('varyRight', 'Service - Vary Right (General)::::Service - Vary Right (General)::::الخدمة-تغيير حق (عام)::::Service - Varier Droit (Général)::::የአገልግሎት - መብት አሻሽል (አጠቃላይ)', 'c', 'Registration Service. Allows the Vary Right (General) service to be started. ::::Registration Service. Allows the Vary Right (General) service to be started.::::Registration Service. Allows the Vary Right (General) service to be started.::::Service Enregistrement. Permet au Service - Varier Droit (Général) de commencer.::::የምዝገባ አገልግሎት - የመብት አሻሻል (ጠቅላላ) አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('regnOnTitle', 'Service - Registration on Title::::Service - Registration on Title::::الخدمة-تسجيل سند ملكية::::Service - Enregistrement du Titre::::የአገልግሎት - የይዞታ መብት ማረጋገጫ ሰነድ ምዝገባ', 'c', 'Registration Service. Allows the Registration on Title service to be started. ::::Registration Service. Allows the Registration on Title service to be started.::::Registration Service. Allows the Registration on Title service to be started.::::Service Enregistrement. Permet au Service - Enregistrement du Titre de commencer.::::የምዝገባ አገልግሎት - በይዞታ መብት ማረጋገጫ ሰነድ ላይ የመመዝገብ አገልግሎት እንዲጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnWithdraw', 'Appln Action - Withdraw::::Appln Action - Withdraw::::حركة طلب-سحب::::Action Demande - Retirer::::ማመልከቻ ተግባር - አውጣ', 'c', 'Required to perform the Withdraw applicaiton action. The Withdraw action transitions the application into the Annulled state.  ::::Required to perform the Withdraw applicaiton action. The Withdraw action transitions the application into the Annulled state.::::Required to perform the Withdraw applicaiton action. The Withdraw action transitions the application into the Annulled state.::::Requis pour retirer une demande. L''action Retirer fait le lien avec la demande d''annulation.::::የማመልከቻውን አውጣ ተግባር እንዲፈፅም ይገደዳል፤ የአውጣ ተግባር ማመልከቻውን ወደ ፈራሽነት ደረጃ ያሸጋግረዋል');
INSERT INTO approle (code, display_value, status, description) VALUES ('CompleteService', 'Service Action - Complete::::Service Action - Complete::::حركة خدمة-اكمال::::Action Service - Exécuter::::የአገልግሎት ድርጊት - አጠናቅ', 'c', 'Allows any service to be completed::::Allows any service to be completed::::Allows any service to be completed::::Permet à n''importe quel service d''être exécuté::::ማንኛውም አገልግሎት እንዲጠናቀቅ ይፍቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('BulkApplication', 'Bulk Operations - Login ::::Bulk Operations - Login::::عمليات الحزمة- تسجيل الدخول::::Opérations Massive - Connection::::ጅምላ ኦፕሬሽኖች - ግባ', 'c', 'Allows the user to login and use the Bulk Operations application. ::::Allows the user to login and use the Bulk Operations application.::::Allows the user to login and use the Bulk Operations application.::::Permet à l''utilisateur de se connecter et d''utiliser l''application d''Opération Massive.::::ተጠቃሚው እንዲገባ እና የጅምላ ኦፕሬሽኖች ማመልከቻ እንዲጠቀም ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('mapExistingParcel', 'Map Existing Parcel::::Map Existing Parcel::::الخارطة- القطع الموجودة::::Plan Parcelle Existante::::ቁራሽ መሬቱን ካርታ አንሳ', 'c', 'Allows to map existing parcel as described on existing title. ::::Allows to map existing parcel as described on existing title.::::Allows to map existing parcel as described on existing title.::::Permet de tracer le plan de la parcelle existante comme décrit sur le titre existant.::::አንድ ያለ ቁራሽ መሬት በይዞታ መብት ማረጋገጫ ሰነድ ላይ በተገለጸው መልኩ ካርታ ለማንሳት ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('PrintMap', 'Map - Print::::Map - Print::::الخارطة-طباعة::::Plan - Imprimer::::ካርታ ፕሪንት አድርግ', 'c', 'Allows the user to create printouts from the Map::::Allows the user to create printouts from the Map::::Allows the user to create printouts from the Map::::Permet à l''utilisateur de créer des plans à imprimer.::::ተጠቃሚውን ከካርታው ፕሪንት የሚደረጉ ጉዳዮችን ለማቋቋም ይጠቅማል');
INSERT INTO approle (code, display_value, status, description) VALUES ('slNotify', 'Service - Manage Notifications::::::::::::::::የአገልግሎት - ማስጠንቀቂያዎችን አስተዳደር', 'c', 'State Land Service. Allows the Manage Notifications service to be started.::::::::::::::::የመንግስት መሬት አገልግሎት ማስታወቂያዎችን የማስተዳደር አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('newApartment', 'Service - New Apartment Title::::Service - New Apartment Title::::الخدمة-سند ملكية شقة جديد::::Service - Titre Nouvel Appartement::::የአገልግሎት - አዲስ የአፓርታማ ባለሀብትነት', 'c', 'Registration Service. Allows the New Apartment Title service to be started. ::::Registration Service. Allows the New Apartment Title service to be started.::::Registration Service. Allows the New Apartment Title service to be started.::::Service Enregistrement. Permet au Service - Titre Nouvel Appartement de commencer.::::የምዝገባ አገልግሎት - የአዲስ አፓርታማ መብት መዝግብ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnStatus', 'Application - Status Report::::Application - Status Report::::طلب-تقرير الحالة::::Demande - Liste par Statut::::ማመልከቻ - ደረጃ ሪፖርት', 'c', 'Allows the user to print a status report for the application.::::Allows the user to print a status report for the application.::::Allows the user to print a status report for the application.::::Permet à l''utilisateur d''imprimer une liste des demandes par statut.::::ተጠቃሚው የመመልከቻ ደረጃን ፕሪንት ለማድረግ ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('BaunitCertificate', 'Property - Print Certificate::::Property - Print Certificate::::الملكية-طباعة الشهادة::::Propriété - Imprimer Certificat::::ንብረት - ሰርተፊኬት ፕሪንት', 'c', 'Allows the user to generate a property certificate. ::::Allows the user to generate a property certificate.::::Allows the user to generate a property certificate.::::Permet à l''utilisateur de générer un certificat de propriété.::::ተጠቃሚውን የንብረት ሰርተፊኬት ለማመንጨት ይጠቅማል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnArchive', 'Appln Action - Archive::::Appln Action - Archive::::جركة طلب - أرشفة::::Action Demande - Archiver::::ማመልከቻ ተግባር - በማሕደር አቆይ', 'c', 'Required to perform the Archive applicaiton action. The Archive action transitions the application into the Completed state.  ::::Required to perform the Archive applicaiton action. The Archive action transitions the application into the Completed state.::::Required to perform the Archive applicaiton action. The Archive action transitions the application into the Completed state.::::Requis pour pouvoir effectuer l''action d''archivage de la demande. L''action d''archivage transforme le statut de la demande en "Exécuté".::::የማህደር መልስ ማመልከቻ ተግባር እንዲፈጽም ይገደዳል፤ ወደ ማህደር መልስ ተግባር ማመልከቻውን ወደ መጠየቂያ ደረጃ ያሸጋግረዋል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ReportGenerate', 'Reporting - Management Reports::::Reporting - Management Reports::::تقارير-ادارة التقارير::::Reporting - Rapport de Management::::ዘገባ - የዘገቦች አስተዳደር ', 'c', 'Allows users to generate and view management reports (e.g. Lodgement Report)::::Allows users to generate and view management reports (e.g. Lodgement Report)::::Allows users to generate and view management reports (e.g. Lodgement Report)::::Permet à l''utilisateur de générer et visualiser les rapports de management (ex: Liste des dépôts)::::ተጠቃሚዎች የአስተዳደር ሪፖርቶችን ለማመንጨት እና ለማየት ይፈቅድላቸዋል (ምሳሌ የአቤቱታ ርፖርት)');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnAssignSelf', 'Application - Assign to Self::::Application - Assign to Self::::تعيين ذاتي::::Demande - Auto Assignation::::ማመልከቻ - ለራስ መድብ', 'c', 'Allows a user to assign an application to themselves.::::Allows a user to assign an application to themselves.::::Allows a user to assign an application to themselves.::::Permet à l''utilisateur de s''auto-assigner une demande.::::ተጠቃሚ ለራሱ ማመልከቻ ለመመደብ ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('TransactionCommit', 'Doc Registration - Save::::Doc Registration - Save::::تسجيل وثيقة-حفظ::::Enregistrement Doc - Sauvegarder::::ሰነድ ምዝገባ - አቆይ', 'c', 'Allows documents for registration such as Power of Attorney and Standard Documents to be saved on the Document Registration screen. ::::Allows documents for registration such as Power of Attorney and Standard Documents to be saved on the Document Registration screen.::::Allows documents for registration such as Power of Attorney and Standard Documents to be saved on the Document Registration screen.::::Permet de sauvegarder des documents pour l''enregistrement tels que Procuration ou Document Standard Documents depuis l''écran d''enregistrement de Document.::::በሰነድ ምዝገባ ስክሪን ላይ ለምዝገባ የቀረቡ እንደ የውክልና ውል እና ስታንዳርድ ሰነዶችን ለማቆየት ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('04SEC_Secret', 'Security - Secret::::::::::::::::ደህንነት - ምስጢር', 'c', 'Grants user clearance to view and/or access all unrestricted, restricted, confidential and secret records.::::::::::::::::ሁሉንም ያልተገደቡ፤ የተገደቡ፤ ግላዊ ምጢር እና ምስጢራዊ ሪኮርዶች ለማየት እና/ወይም ለመጠቀም ፈቃድ ይሰጣል');
INSERT INTO approle (code, display_value, status, description) VALUES ('MeasureMap', 'Map - Measure::::::::::::::::ካርታ ለካ', 'c', 'Allows the user to measure distances on the map using the Measure tool.::::::::::::::::ተጠቃሚው በካርታ ላይ የሚለካ መሳሪያ በመጠቀም ርቀቶችን እንዲለካ ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('buildingRestriction', 'Service - Register Building Restriction::::Service - Register Building Restriction::::الخدمة-تسجيل قيد بناء::::Service - Enregistrement Restriction de Construction::::የአገልግሎት - የሕንጻ ገደብ መዝግብ', 'c', 'Registration Service. Allows the Register Building Restriction service to be started. ::::Registration Service. Allows the Register Building Restriction service to be started.::::Registration Service. Allows the Register Building Restriction service to be started.::::Service Enregistrement. Permet au Service - Enregistrement Restriction de Construction de commencer.::::የምዝገባ አገልግሎት - የሕንጻ ገደብ መዝግብ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ChangePassword', 'Admin - Change Password::::Admin - Change Password::::ادارة-تغيير كلمة المرور::::Admin - Changer le Mot de Passe::::አስተዳደራዊ የይለፍ ቃል ለውጥ', 'c', 'Allows a user to change their password and edit thier user name. This role should be included in every security group. ::::Allows a user to change their password and edit thier user name. This role should be included in every security group.::::Allows a user to change their password and edit thier user name. This role should be included in every security group.::::Permet à l''utilisateur de changer son mot de passe et d''éditer son nom d''utilisateur. Ce rôle doit être inclus dans tous les groupes de sécurité.::::ተጠቃሚው የይለፍ ቃሉ ለመቀየር እና የመጠቀሚያ ስሙን ለማርትዕ ይፈቅዳል፤ ይህ ሚና ማንኛውም የደህንነት ስብስብ ውስጥ መካተት አለበት');
INSERT INTO approle (code, display_value, status, description) VALUES ('cancelProperty', 'Service - Cancel Title::::Service - Cancel Title::::الخدمة-الغاء سند ملكية::::Service - Annuler Titre::::የአገልግሎት - የይዞታ መብት ማረጋገጫ ሰነድ ሰርዝ', 'c', 'Lease Service. Allows the Cancel Title to be started. ::::Lease Service. Allows the Cancel Title to be started.::::Lease Service. Allows the Cancel Title to be started.::::Service Enregistrement. Permet au Service - Annuler Titre de commencer.::::የሊዝ አገልግሎት የይዞታ መብት መረጋገጫ ሰነድ ሰርዝ አገልግሎት እንዲጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('01SEC_Unrestricted', 'Security - Unrestricted::::::::::::::::ደህንነት - ያልተገደበ', 'c', 'Grants user clearance to view and/or access all unrestricted records.::::::::::::::::ሁሉንም ያልተገደቡ ሪኮርዶች ለማየት እና/ወይም ለመጠቀም ፈቃድ ይሰጣል');
INSERT INTO approle (code, display_value, status, description) VALUES ('05SEC_TopSecret', 'Security - Top Secret::::::::::::::::ደህንነት - ጥብቅ ምስጢር', 'c', 'Grants user clearance to view and/or access all records.::::::::::::::::ሁሉንም ሪኮርዶች ለማየት እና/ወይም ለመጠቀም ፈቃድ ይሰጣል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ChangeSecClass', 'Security - Change Security Classification::::::::::::::::ደህንነት - የደህንነት አመዳደብ ለውጥ', 'c', 'Allows the user to set or change the security classification for a record.::::::::::::::::ተጠቃሚው የአንድ ሪኮርድን የደህንነት ምደባ እንዲያበጅ ወይም እንዲለውጥ ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('BaUnitNotes', 'Property - Add & Edit Notes::::::::::::::::ንብረት - ጨምር እና ማስታወሻዎች አርትዕ', 'c', 'Allows property notes to be added or edited.::::::::::::::::የንብረት ማስታወሻ ለመጨመር ወይንም ለማርትዕ ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('slLicense', 'Service - Record License', 'c', 'State Land Service. Allows the Record License task to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('slLeaseChange', 'Service - Change Lease', 'c', 'State Land Service. Allows the Change Lease task to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('slLicenseChange', 'Service - Change License', 'c', 'State Land Service. Allows the Change License task to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('slLicenseCancel', 'Service - Cancel License', 'c', 'State Land Service. Allows the Cancel License task to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('slInterest', 'Service - Record Interest', 'c', 'State Land Service. Allows the Record Interest task to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('slInterestChange', 'Service - Change Interest', 'c', 'State Land Service. Allows the Change Interest task to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('slClaim', 'Service - Record Claim', 'c', 'State Land Service. Allows the Record Claim task to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('slClaimChange', 'Service - Change Claim', 'c', 'State Land Service. Allows the Change Claim task to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('slClaimCancel', 'Service - Cancel Claim', 'c', 'State Land Service. Allows the Cancel Claim task to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('recordStateLand', 'Service - Record State Land::::::::::::::::የአገልግሎት - የመንግስት መሬት ሪኮርድ', 'c', 'State Land Service. Allows the Record State Land service to be started.::::::::::::::::የመንግስት መሬት አገልግሎት፤ የመንግስት መሬት ሪኮርድ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('changeSLParcels', 'Service - Change State Land Parcels::::::::::::::::የአገልግሎት - የመንግስት ቁራሽ መሬቶችን ለውጥ ', 'c', 'State Land Service. Allows the Change State Land Parcels service to be started.::::::::::::::::የመንግስት መሬት አገልግሎት፤ የመንግስት ቁራሽ መሬቶች ለውጥ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('checklist', 'Service - Checklist::::::::::::::::የአገልግሎት - መሟላት ያለባቸው ነገሮች ዝርዝር', 'c', 'State Land Service. Allows the Checklist service to be started.::::::::::::::::የመንግስት መሬት አገልግሎት፤ መሟላት ያለባቸው ዝርዝር ጉዳዮች አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('maintainStateLand', 'Service - Maintain State Land::::::::::::::::የአገልግሎት - የመንግስት መሬት መረጃ ጠብቅ', 'c', 'State Land Service. Allows the Maintain State Land service to be started.::::::::::::::::የመንግስት መሬት አገልግሎት፤ የመንግስት መሬት መረጃ የመጠበቅ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('documentCopy', 'Service - Document Copy::::Service - Document Copy::::الحدمة-نسخ وثيقة::::Service - Copier Document::::የአገልግሎት - ሰነድ ኮፒ አድርግ', 'c', 'Supporting Service. Allows the Document Copy service to be started.::::Supporting Service. Allows the Document Copy service to be started.::::Supporting Service. Allows the Document Copy service to be started.::::Service Soutien. Permet au Service - Copier Document de commencer.::::ደጋፊ አገልግሎት፤ የሰነድ ቅጂ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('cadastreChange', 'Service - Change to Cadastre::::Service - Change to Cadastre::::الخدمة-تغيير مساحة::::Service - Modification du Cadastre::::የአገልግሎት - የካዳስተር ለውጥ', 'c', 'Survey Service. Allows the Change to Cadastre service to be started::::Survey Service. Allows the Change to Cadastre service to be started::::Survey Service. Allows the Change to Cadastre service to be started::::Service Levé Cadastral. Permet au Service - Modification du Cadastre de commencer.::::የቅየሳ አገልግሎት፤ የካዳስተር ለውጥ አገልግሎት እንዲጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ObjectionCommentEdit', 'Workflow - Edit Objection Comment::::::::::::::::የስራ ፍሰት - የተቃውሞ አስተያየቱን አርትዕ ', 'c', 'Allows the user to edit or remove all Timeline comments on an Objection task.::::::::::::::::ተጠቃሚውን የተቃዉሞ ተግባር ላይ የተሰጡ ሁሉንም የጊዜ ቅደም ተከተል አስተያየቶች ለማርተእ ወይም ለማስወገድ ይጠቅማል');
INSERT INTO approle (code, display_value, status, description) VALUES ('consolidationExt', 'Admin - Consolidation Extract::::Admin - Consolidation Extract::::Admin - Consolidation Extract::::Admin - Consolidation Extract::::አስተዳደራዊ ከተጣመረው ውሰድ', 'c', 'Allows system administrators to start the extraction or records for consolidating in another system.::::Allows system administrators to start the extraction or records for consolidating in another system.::::Allows system administrators to start the extraction or records for consolidating in another system.::::Allows system administrators to start the extraction or records for consolidating in another system.::::የሲስተም አስተዳዳሪዎች ከሌላ ሥርዓት ጋር ለማጣመር ሪኮርዶችን መውሰድ እንዲጀምሩ ይጠቅማል ');
INSERT INTO approle (code, display_value, status, description) VALUES ('systematicRegn', 'Service - Systematic Registration Claim::::Service - Systematic Registration Claim::::الخدمة-المطالبة بتسجيل منتظم::::Service - Déclaration Enregistrement Systématique::::የአገልግሎት - አጠቃላይ ምዝገባ ጥያቄ', 'c', 'Systematic Registration Service - Allows the Systematic Registration Claim service to be started. ::::Systematic Registration Service - Allows the Systematic Registration Claim service to be started.::::Systematic Registration Service - Allows the Systematic Registration Claim service to be started.::::Service Enregistrement Systématique. Permet au Service - Déclaration Enregistrement Systématique de commencer.::::አጠቃላይ ምዝገባ አገልግሎት፤ አጠቃላይ የመብት ጥያቄ ምዝገባ እንዲጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('publicDisplay', 'Service - Manage Public Display::::::::::::::::የአገልግሎት - ለሕዝብ ዕይታ የሚቀርበውን መረጃ አስተዳደር', 'c', 'State Land Service. Allows the Manage Public Display service to be started.::::::::::::::::የመንግስት መሬት አገልግሎት፤ ለሕዝብ የሚታየውን መረጃ የማስተዳደር አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('regnPowerOfAttorney', 'Service - Registration of Power of Attorney::::Service - Registration of Power of Attorney::::الخدمة-تسجيل وكالة::::Service - Enregistrement de Procuration::::የአገልግሎት - የውክልና ሰነድ ምዝገባ ', 'c', 'Registration Service. Allows the Registration of Power of Attorney service to be started. ::::Registration Service. Allows the Registration of Power of Attorney service to be started.::::Registration Service. Allows the Registration of Power of Attorney service to be started.::::Service Enregistrement. Permet au Service - Enregistrement de Procuration de commencer.::::የምዝገባ አገልግሎት - የውክልና ሰነድ መዝግብ አገልግሎት እንዲጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('03SEC_Confidential', 'Security - Confidential::::::::::::::::ደህንነት - ግላዊ ምስጢር', 'c', 'Grants user clearance to view and/or access all unrestricted, restricted and confidential records.::::::::::::::::ሁሉንም ያልተገደቡ፤ የተገደቡና ግላዊ ሚስጢር ሪኮርዶች ለማየት እና/ወይም ለመጠቀም ፈቃድ ይሰጣል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnRequisition', 'Appln Action - Requisition::::Appln Action - Requisition::::حركة طلب-طلب معلومات::::Action Demande - Réquisitionner::::ማመልከቻ ተግባር - መጠየቂያ', 'c', 'Required to perform the Requisition applicaiton action. The Requisition action transitions the application into the Requisitioned state. ::::Required to perform the Requisition applicaiton action. The Requisition action transitions the application into the Requisitioned state.::::Required to perform the Requisition applicaiton action. The Requisition action transitions the application into the Requisitioned state.::::Requis pour pouvoir effectuer l''action de réquisition de la demande. L''action de réquisition transforme le statut de la demande en "Réquisitionné".::::የመጠየቂያ ማመልከቻ ተግባር እንዲፈጽም ይገደዳል፤ የመጠየቂያ ተግባር ማመልከቻውን ወደ የመጠየቂያ ደረጃ ያሸጋግረዋል');
INSERT INTO approle (code, display_value, status, description) VALUES ('cadastrePrint', 'Service - Cadastre Print::::Service - Cadastre Print::::الخدمة-طباعة مساحة::::Service - Imprimer Cadastre::::የአገልግሎት - ካዳስተር ፕሪንት', 'c', 'Supporting Service. Allows the Cadastre Print service to be started. ::::Supporting Service. Allows the Cadastre Print service to be started.::::Supporting Service. Allows the Cadastre Print service to be started.::::Service Soutien. Permet au Service - Imprimer Cadastre de commencer.::::ደጋፊ አገልግሎት፤ የካዳስተር ፕሪንት አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('RevertService', 'Service Action - Revert::::Service Action - Revert::::حركة خدمة-التراجع::::Action Service - Retourner en arrière::::የአገልግሎት ድርጊት - ወደኃላ መልስ', 'c', 'Allows any completed service to be reverted to a Pending status for further action. ::::Allows any completed service to be reverted to a Pending status for further action.::::Allows any completed service to be reverted to a Pending status for further action.::::Permet à n''importe quel service exécuté d''être revu et retourné en arrière, au statut en attente avant de passer à une action suivante.::::ማንኛውም የተጠናቀቀ አገልግሎት በእንጥልጥል ያለና ተጨማሪ ተግባር ወደ የሚያሻው ደረጃ እንዲሸጋገር ይፍቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('cnclStandardDocument', 'Service - Withdraw Standard Document::::Service - Withdraw Standard Document::::الحدمة-سحب وثيقة معيارية::::Service - Retirer Document Standard::::የአገልግሎት - ስታንዳርድ ሰነድ አውጣ', 'c', 'Registration Service. Allows the Withdraw Standard Document service to be started. ::::Registration Service. Allows the Withdraw Standard Document service to be started.::::Registration Service. Allows the Withdraw Standard Document service to be started.::::Service Enregistrement. Permet au service Retirer Document Standard de commencer.::::የምዝገባ አገልግሎቶች - የስታንዳረድ ሰነድ አውጣ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('removeCaveat', 'Service - Remove Caveat::::Service - Remove Caveat::::الخدمة-ازالة مانع::::Service - Supprimer Caveat::::የአገልግሎት - የእክል ማስጠንቀቂያ አስወግድ', 'c', 'Registration Service. Allows the Remove Caveat service to be started. ::::Registration Service. Allows the Remove Caveat service to be started.::::Registration Service. Allows the Remove Caveat service to be started.::::Service Enregistrement. Permet au Service - Supprimer Caveat de commencer.::::የምዝገባ አገልግሎት - የእክል ማስጠንቀቂያ አስወግድ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('regnStandardDocument', 'Service - Registration of Standard Document::::Service - Registration of Standard Document::::الخدمة-تسجيل وثيقة معيارية::::Service - Enregistrement de Document Standard::::የአገልግሎት - የስታንዳርድ ሰነድ ምዝገባ ', 'c', 'Registration Service. Allows the Register of Standard Document service to be started. ::::Registration Service. Allows the Register of Standard Document service to be started.::::Registration Service. Allows the Register of Standard Document service to be started.::::Service Enregistrement. Permet au Service - Enregistrement de Document Standard de commencer.::::የምዝገባ አገልግሎት - ስታንዳርድ ሰነድ መዝግብ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('limtedRoadAccess', 'Service - Register Limited Road Access::::Service - Register Limited Road Access::::الخدمة-تسجيل حق طريق محدود::::Service - Enregistrement d''un Accès Limité à la Route::::የአገልግሎት - ውስን መንገድ ማለፊያ መዝገብ', 'c', 'Registration Service. Allows the Register Limited Road Access service to be started. ::::Registration Service. Allows the Register Limited Road Access service to be started.::::Registration Service. Allows the Register Limited Road Access service to be started.::::Service Enregistrement. Permet au Service - Enregistrement d''un Accès Limité à la Route de commencer.::::የምዝገባ አገልግሎት - የውስን የመንገድ ማለፊያ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnResubmit', 'Appln Action - Resubmit::::Appln Action - Resubmit::::حركة طلب-اعادة تقديم::::Action Demande - Resoumettre::::ማመልከቻ ተግባር - እንደገና አቅርብ', 'c', 'Required to perform the Resubmit applicaiton action. The Resubmit action transitions the application into the Lodged state if it is currently On Hold. ::::Required to perform the Resubmit applicaiton action. The Resubmit action transitions the application into the Lodged state if it is currently On Hold.::::Required to perform the Resubmit applicaiton action. The Resubmit action transitions the application into the Lodged state if it is currently On Hold.::::Requis pour pouvoir effectuer l''action de resubmission de la demande. L''action de resubmission transfert la demande en statut "déposé" si celui-ci est pour le moment "en attente".::::የማመልከቻ እንደገና አቅርብ ተግባር እንዲፈጽም ይገደዳል፤ ማመልከቻው በወቅቱ በይቆይ ተይዞ ከነበረ የእንደገና አቅርብ ተግባር ማመልከቻውን ወደ አቤቱታ አቅርብ ደረጃ ያሸጋግረዋል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnApprove', 'Appln Action - Approval::::Appln Action - Approval::::حركة طلب - الموافقة::::Action Demande - Approuver::::ማመልከቻ ተግባር - መፍቀድ', 'c', 'Required to perform the Approve applicaiton action. The Approve action transitions the application into the Approved state. 
All services on the application must be completed before this action is available. ::::Required to perform the Approve applicaiton action. The Approve action transitions the application into the Approved state.
All services on the application must be completed before this action is available.::::Required to perform the Approve applicaiton action. The Approve action transitions the application into the Approved state.
All services on the application must be completed before this action is available.::::Requis pour pouvoir effectuer l''action d''approbation de la demande. L''action d''approbation transforme le statut de la demande en "Approuvé". Tous les services de l''application doivent être exécuté avant que cette action soit possible.::::የአጽድቅ ማመልከቻ ተግባር እንዲፈጽም ይገደዳል፤ የአጽድቅ ተግባር ማመልከቻውን ወደ አጽድቅ ደረጃ ያሸጋግረዋል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnView', 'Application - Search & View::::Application - Search & View::::الطلب-البحث والعرض::::Demande - Rechercher et Visualiser::::ማመልከቻ - ፈልግ እና ተመልከት', 'c', 'Allows users to search and view application details.::::Allows users to search and view application details.::::Allows users to search and view application details.::::Permet à l''utilisateur de rechercher et visualiser les détails d''une demande.::::ተጠቃሚዎች የማመልከቻ ዝርዝር ለመፈለግ እና ለማየት ይፈቅድላቸዋል');
INSERT INTO approle (code, display_value, status, description) VALUES ('cnclPowerOfAttorney', 'Service - Cancel Power of Attorney::::Service - Cancel Power of Attorney::::الخدمة-الغاء وكالة::::Service - Annuler Procuration::::የአገልግሎት - የውክልና ሰነድ ሰርዝ', 'c', 'Registration Service. Allows the Cancel Power of Attorney service to be started::::Registration Service. Allows the Cancel Power of Attorney service to be started::::Registration Service. Allows the Cancel Power of Attorney service to be started::::Service Enregistrement. Permet au Service - Annuler Procuration de commencer.::::የምዝገባ አገልግሎት - የውክልና ሰነድ ሰርዝ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('02SEC_Restricted', 'Security - Restricted::::::::::::::::ደህንነት - የተገደበ', 'c', 'Grants user clearance to view and/or access all unrestricted and restricted records.::::::::::::::::ሁሉንም ያልተገደቡና የተገደቡ ሪኮርዶች ለማየት እና/ወይም ለመጠቀም ፈቃድ ይሰጣል');
INSERT INTO approle (code, display_value, status, description) VALUES ('10SEC_SuppressOrd', 'Security - Suppression Order::::::::::::::::ደህንነት - መረጃ ለህዝብ ይፋ አታድርግ ትእዛዝ', 'c', 'Grants user clearance to view and/or access all records marked with the Supression Order security classification.::::::::::::::::በመረጃ አትስጥ ትእዛዝ የደህንነት ምደባ የተያዙ ሁሉንም ሪኮርዶች ለማየት እና/ወይም ለመጠቀም ፈቃድ ይሰጣል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ManageRefdata', 'Admin - Reference Data::::Admin - Reference Data::::ادارة-البيانات المرجعية::::Admin - Données de Référence::::አስተዳደራዊ ሪፈረንስ ዳታ', 'c', 'Allows system administrators to manage (edit and save) reference data details.  Users with this role will be able to login to the SOLA Admin application. ::::Allows system administrators to manage (edit and save) reference data details.  Users with this role will be able to login to the SOLA Admin application.::::Allows system administrators to manage (edit and save) reference data details.  Users with this role will be able to login to the SOLA Admin application.::::Permet à l''administrateur système de gérer (éditer et sauvegarder) les détails des données de référence. Les utilisateurs avec ce rôle peuvent se connecter à l''application SOLA Admin.::::የሲስተም አስተዳዳሪዎች የሪፈረንስ ዝርዝር ዳታ ለማስተዳደር (ለማርትዕ እና ለማቆየት) ይጠቅማል፤ የዚህ ሚና ያላቸው ተጠቃሚዎች ወደ ተመአ ትግበራ ለመግባት ይችላል');
INSERT INTO approle (code, display_value, status, description) VALUES ('consolidationCons', 'Admin - Consolidation Consolidate::::Admin - Consolidation Consolidate::::Admin - Consolidation Consolidate::::Admin - Consolidation Consolidate::::አስተዳደራዊ የተጣመረውን አጣምር', 'c', 'Allows system administrators to consolidate records coming from another system.::::Allows system administrators to start the extraction or records for consolidating in another system.::::Allows system administrators to start the extraction or records for consolidating in another system.::::Allows system administrators to start the extraction or records for consolidating in another system.::::የሲስተም አስተዳዳሪዎች ከሌላ ሥርዓት የሚመጡ ሪኮርዶችን ለማጣመር ይፈቅዳል   ');
INSERT INTO approle (code, display_value, status, description) VALUES ('ManageSecurity', 'Admin - Users and Security::::Admin - Users and Security::::ادارة-المستخدمين وسرية النظام::::Admin - Utilisateurs et Sécurité::::አስተዳደራዊ ተጠቃሚዎች እና ደህንነት', 'c', 'Allows system administrators to manage (edit and save) users, groups and roles. Users with this role will be able to login to the SOLA Admin application. ::::Allows system administrators to manage (edit and save) users, groups and roles. Users with this role will be able to login to the SOLA Admin application.::::Allows system administrators to manage (edit and save) users, groups and roles. Users with this role will be able to login to the SOLA Admin application.::::Permet à l''administrateur système de gérer (éditer et sauvegarder) les utilisateurs, groupes et rôles. Les utilisateurs avec ce rôle peuvent se connecter à l''application SOLA Admin.::::የሲስተም አስተዳዳሪዎችን ተጠቃሚዎችን፤ ስብስቦችን እና ሚናዎችን ለማስተዳደር (ለማርትዕ እና ለማቆየት) ይጠቅማል፤ ይህ ሚና ያላቸው ተጠቃሚዎች ወደ ተመአ ትግበራ ለመግባት ይችላሉ');
INSERT INTO approle (code, display_value, status, description) VALUES ('ManageSettings', 'Admin - System Settings::::Admin - System Settings::::ادارة-اعدادات النظام::::Admin - Paramètres Système::::አስተዳደራዊ ሲስተም ሴቲንጎች', 'c', 'Allows system administrators to manage (edit and save) system setting details. Users with this role will be able to login to the SOLA Admin application. ::::Allows system administrators to manage (edit and save) system setting details. Users with this role will be able to login to the SOLA Admin application.::::Allows system administrators to manage (edit and save) system setting details. Users with this role will be able to login to the SOLA Admin application.::::Permet à l''administrateur système de gérer (éditer et sauvegarder) les détails des paramètres du système. Les utilisateurs avec ce rôle peuvent se connecter à l''application SOLA Admin.::::የሲስተም አስተዳዳሪዎች የሲስተም ሴቲንግ ዝርዝር ጉዳዮች ለማስተዳደር (ለማርትዕ እና ለማቆየት) ይጠቅማል፤ የዚህ ሚና ያላቸው ተጠቃሚዎች ወደ ተመአ ትግበራ ለመግባት ይችላል  ');
INSERT INTO approle (code, display_value, status, description) VALUES ('ManageBR', 'Admin - Business Rules::::Admin - Business Rules::::ادارة-قواعد الاعمال::::Admin - Règles Métiers (BR)::::አስተዳደራዊ የሥራ ደንብ', 'c', 'Allows system administrators to manage (edit and save) business rules.::::Allows system administrators to manage (edit and save) business rules.::::Allows system administrators to manage (edit and save) business rules.::::Permet à l''administrateur système de gérer (éditer et sauvegarder) les règles métiers.::::የሲስተም አስተዳዳሪዎች የቢዝነስ ደንቦችን ለማስተዳደር (ለማርትዕ እና ለማቆየት) ይፈቅዳል  ');
INSERT INTO approle (code, display_value, status, description) VALUES ('titleSearch', 'Service - Title Search::::Service - Title Search::::الخدمة-البحث عن ملكية::::Service - Recherche Titre::::የአገልግሎት - የይዞታ መብት መረጋገጫ ሰለድ ፈልግ', 'c', 'Supporting Service. Allows the Title Search service to be started. ::::Supporting Service. Allows the Title Search service to be started.::::Supporting Service. Allows the Title Search service to be started.::::Service Soutien. Permet au Service - Recherche Titre de commencer.::::ደጋፊ አገልግሎት፤ የይዞታ መብት ማረጋገጫ ሰነድ ፍለጋ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('surveyPlanCopy', 'Service - Survey Plan Copy::::Service - Survey Plan Copy::::الخدمة-نسخ خطة مسح::::Service - Copier Plan de Levé::::የአገልግሎት - የቅየሳ ፕላን ቅጂ', 'c', 'Supporting Service. Allows the Survey Plan Copy service to be started. ::::Supporting Service. Allows the Survey Plan Copy service to be started.::::Supporting Service. Allows the Survey Plan Copy service to be started.::::Service Soutien. Permet au Service - Copier Plan de Levé de commencer.::::ደጋፊ አገልግሎት፤ የቅየሳ ፕላን ቅጂ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('redefineCadastre', 'Service - Redefine Cadastre::::Service - Redefine Cadastre::::الخدمة-اعادة تعريف المساحة::::Service - Redéfinition du Cadastre::::የአገልግሎት - የካዳስተር ክለሳ መዝግብ', 'c', 'Survey Service. Allows the Redefine Cadastre service to be started. ::::Survey Service. Allows the Redefine Cadastre service to be started.::::Survey Service. Allows the Redefine Cadastre service to be started.::::Service Levé Cadastral. Permet au Service - Redéfinition du Cadastre de commencer.::::የቅየሳ አገልግሎት፤ የካዳስተር ከልስ አገልግሎት እንዲጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('publicDisplayMap', 'Service - Public Display Map::::::::::::::::የአገልግሎት - ለሕዝብ የሚታይ ካርታ', 'c', 'State Land Service. Allows the Public Display Map service to be started.::::::::::::::::የመንግስት መሬት አገልግሎት፤ ለሕዝብ ካርታ የማሳየት አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('slValuation', 'Service - Manage Valuations::::::::::::::::የአገልግሎት - የንብረት ግምቶችን አስተዳደር ', 'c', 'State Land Service. Allows the Manage Valuations service to be started.::::::::::::::::የመንግስት መሬት አገልግሎት፤ የንብረት ግምቶችን የማስተዳደር አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('lodgeObjection', 'Service - Lodge Objection::::Service - Lodge Objection::::الخدمة-ايداع اعتراض::::Service - Dépôt d''Objection::::የአገልግሎት - ተቃውሞ አቅርብ', 'c', 'Systematic Registration Service. Allows the Lodge Objection service to be started.::::Systematic Registration Service. Allows the Lodge Objection service to be started.::::Systematic Registration Service. Allows the Lodge Objection service to be started.::::Service Enregistrement Systématique. Permet au Service - Dépôt d''Objection de commencer.::::አጠቃላይ ምዝገባ አገልግሎት፤ ተቃውሞ አቅርብ የሚለውን አገልግሎት እንዲጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('disposeSLProperty', 'Service - Dispose Property::::::::::::::::የአገልግሎት - ንብረት አስተላልፍ', 'c', 'State Land Service. Allows the Dispose Property service to be started.::::::::::::::::የመንግስት መሬት አገልግሎት፤የንብረት የማስተላለፍ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('cancelInterest', 'Service - Cancel State Land Interest::::::::::::::::የአገልግሎት - የመንግስት መሬት ጥቅም ሰርዝ', 'c', 'State Land Service. Allows the Cancel State Land Interest service to be started.::::::::::::::::የመንግስት መሬት አገልግሎት፤ የመንግስት መሬት ጥቅም የመሰረዝ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('varyLease', 'Service - Vary Lease::::Service - Vary Lease::::الخدمة- تغيير ايجار::::Service - Varier Bail::::የአገልግሎት - ሊዝ አሻሽል', 'c', 'Registration Service. Allows the Vary Lease service to be started. ::::Registration Service. Allows the Vary Lease service to be started.::::Registration Service. Allows the Vary Lease service to be started.::::Service Enregistrement. Permet au Service - Varier Bail de commencer.::::የምዝገባ አገልግሎት - የሊዝ አሻሻል አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('removeRight', 'Service - Remove Right (General)::::Service - Remove Right (General)::::الخدمة- ازالة حق عام::::Service - Supprimer Droit (Général)::::የአገልግሎት - መብት አስወግድ (አጠቃላይ)', 'c', 'Registration Service. Allows the Remove Right (General) service to be started. ::::Registration Service. Allows the Remove Right (General) service to be started.::::Registration Service. Allows the Remove Right (General) service to be started.::::Service Enregistrement. Permet au Service - Supprimer Droit (Général) de commencer.::::የምዝገባ አገልግሎት - የመብት አስወግድ (አጠቃላይ) አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('historicOrder', 'Service - Register Historic Preservation Order::::Service - Register Historic Preservation Order::::الخدمة-تسجيل امر حفظ تاريخي::::Service - Enregistrement d''Ordre de Préservation Historique::::የአገልግሎት - የታሪካዊ ንብረቶች ጥበቃ ጥዕዛዝ መዝግብ', 'c', 'Registration Service. Allows the Register Historic Preservation Order service to be started. ::::Registration Service. Allows the Register Historic Preservation Order service to be started.::::Registration Service. Allows the Register Historic Preservation Order service to be started.::::Service Enregistrement. Permet au Service - Enregistrement d''Ordre de Préservation Historique de commencer.::::የምዝገባ አገልግሎት - የታሪካዊ ንብረቶች ጥበቃ ትእዛዝ መዝግብ አገልግሎት ለመጀመር ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnValidate', 'Appln Action - Validate::::Appln Action - Validate::::حركة طلب- التحقق من صحة البيانات::::Action Demande - Valider::::ማመልከቻ ተግባር - አፅድቅ', 'c', 'Required to perform the Validate applicaiton action. Allows the user to manually run the validation rules against the application. ::::Required to perform the Validate applicaiton action. Allows the user to manually run the validation rules against the application.::::Required to perform the Validate applicaiton action. Allows the user to manually run the validation rules against the application.::::Requis pour pouvoir effectuer l''action de demande de validation. Permet à l''utilisateur de confronter manuellement les règles de validation à la demande.::::የማመልከቻ አጽድቅ ተግባር እንዲፈጸም ይገደዳል፤ ይህም ተጠቃሚውን በእጁ የማጽደቂያ ደንቦችን ከማመልከቻው በተቃራኒ እንዲያስኬዳቸው ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnDispatch', 'Appln Action - Dispatch::::Appln Action - Dispatch::::جركة طلب-توزيع::::Action Demande - Envoyer::::ማመልከቻ ተግባር - ላክ', 'c', 'Required to perform the Dispatch application action. Used to indicate that documents have been dispatched to applicant along with any certificates/reports/map prints requested by applicant::::Required to perform the Dispatch application action. Used to indicate that documents have been dispatched to applicant along with any certificates/reports/map prints requested by applicant::::Required to perform the Dispatch application action. Used to indicate that documents have been dispatched to applicant along with any certificates/reports/map prints requested by applicant::::Requis pour pouvoir effectuer l''action d''envoi de la demande. Utilisé pour indiquer que les documents ont été envoyés au demandeur avec certificats / rapports / impression de plan requis par le demandeur.::::የመለኪያ ማመልከቻ ተግባር እንዲፈጽም ይገደዳል፤ በአመልካች የተጠየቁ ሰነዶች ከሰርተፊኬቶች/ዘገባዎች /ካርታዎች ጋረ አብረው መላካቸውን ለማመልከት ይጠቅማል');
INSERT INTO approle (code, display_value, status, description) VALUES ('StartService', 'Service Action - Start::::Service Action - Start::::حركة خدمة-ابدأ::::Action Service - Commencer::::የአገልግሎት ድርጊት - ጀምር', 'c', 'Allows any user to click the Start action. Note that the user must also have the appropraite Service role as well before they can successfully start the service. ::::Allows any user to click the Start action. Note that the user must also have the appropraite Service role as well before they can successfully start the service.::::Allows any user to click the Start action. Note that the user must also have the appropraite Service role as well before they can successfully start the service.::::Permet n''importe quel utilisateur de cliquer pour commencer l''action. Notez que l''utilisateur doit aussi avoir le rôle du service approprié avant de pouvoir commencer le service.::::ማንኛውም ተጠቃሚ የጀምር ተግባር እንዲጫን ይፈቅዳል፤ ተጠቃሚው በስኬታማነት አገልግሎቱን ለመጀመር ቀደም ብሎ ተገቢውን የአገልግሎቱን ሚና ሊኖረው እንደሚገባ ልብ ማለት ያሻል');
INSERT INTO approle (code, display_value, status, description) VALUES ('DashbrdViewAssign', 'Dashboard - View Assigned::::Dashboard - View Assigned::::لوحة المراقبة-مشاهدة الطلبات المعينة::::Accueil - Visulaiser Assignée::::ዳሽቦርድ - የተመደበው ተመልከት', 'c', 'Allows the user to view applications assigned to them in the Dashboard. To hide the Dashboard from the user, remove both this role and the Dashboard - View Unassigned role. ::::Allows the user to view applications assigned to them in the Dashboard. To hide the Dashboard from the user, remove both this role and the Dashboard - View Unassigned role.::::Allows the user to view applications assigned to them in the Dashboard. To hide the Dashboard from the user, remove both this role and the Dashboard - View Unassigned role.::::Permet à l''utilisateur de visualiser routes les demandes assignées dans l''accueil. Pour cacher l''Accueil de l''utilisateur, supprimer ce rôle et le rôle Accueil - Visualiser non Assigné.::::ተጠቃሚው በዳሽቦርዱ ላይ የተመደበለትን ማመልከቻዎች ለማየት ይፈቅዳል፤ ዳሽቦርዱን ተጠቃሚው ለመደበቅ፤ ይህ ተግባር እና ዳሽቦርዱን አስወግድ - ያልተመደበ ተግባር እይ');
INSERT INTO approle (code, display_value, status, description) VALUES ('DashbrdViewUnassign', 'Dashboard - View Unassigned::::Dashboard - View Unassigned::::لوحة المراقبة-مشاهدة الطلبات الغير معينة::::Accueil - Visulaiser Non Assignée::::ዳሽቦርድ - ያልተመደበው ተመልከት', 'c', 'Allows the user to view all unassigned applications in the Dashboard. To hide the Dashboard from the user, remove both this role and the Dashboard - View Assigned role. ::::Allows the user to view all unassigned applications in the Dashboard. To hide the Dashboard from the user, remove both this role and the Dashboard - View Assigned role.::::Allows the user to view all unassigned applications in the Dashboard. To hide the Dashboard from the user, remove both this role and the Dashboard - View Assigned role.::::Permet à l''utilisateur de visualiser routes les demandes non assignées dans l''accueil. Pour cacher l''Accueil de l''utilisateur, supprimer ce rôle et le rôle Accueil - Visualiser Assigné.::::ተጠቃሚው ሁሉንም ያልተመደቡ ማመልከቻዎችን ከዳሽቦርዱ ለማየት ይፈቅዳል፤ ዳሽቦርዱን ከተጠቃሚው ለመደበቅ ይህ ተግባር እና ዳሽቦርዱን አስወግድ - የተመደበ ተግባር እይ');
INSERT INTO approle (code, display_value, status, description) VALUES ('PartySave', 'Party - Edit & Save::::Party - Edit & Save::::الطرف-تعديل وحفظ::::Partie - Editer & Sauvegarder::::ባለጉዳይ - አርት እና አቆይ', 'c', 'Allows party details to be edited and saved unless the party is a rightholder. ::::Allows party details to be edited and saved unless the party is a rightholder.::::Allows party details to be edited and saved unless the party is a rightholder.::::Permet d''éditer et sauvegarder les détails des parties à moins que la partie soit un détenteur de droits.::::ባለጉዳዩ ባለመብት ካልሆነ የባለጉዳዩ ዝርዝር ጉዳዮች ለማርትዕ እና ለማቆየት ይፈቅዳል');
INSERT INTO approle (code, display_value, status, description) VALUES ('NoPasswordExpiry', 'Admin - No Password Expiry::::Admin - No Password Expiry::::ادارة-صلاحية كلمة المرور::::Admin - Non expiration de Mot de Passe::::አስተዳደራዊ የይለፍ ቃል ጊዜ እንዳያልፍ', 'c', 'Users with no password expiry (used by other systems using SOLA web services). Password expiry is configured using pword-expiry-days system.setting::::Users with no password expiry (used by other systems using SOLA web services). Password expiry is configured using pword-expiry-days system.setting::::Users with no password expiry (used by other systems using SOLA web services). Password expiry is configured using pword-expiry-days system.setting::::Les utilisateurs ayant un rôle ne feront pas l''objet d''une expiration de leur mot de passe s''ils en not un. Ce rôle peut être assigné aux comptes utilisateur utisilés par d''autres systèmes à intégrer avec les services Web de SOLA. Notez que cette expiration du mot de passe peut être configurée en utilisant le pword-expiry-days system.setting::::የይለፍ ቃል የመጠቀሚያ ጊዜ የማያልፍባቸው ተጠቃሚዎቸ (ተመአመ ድረ-ገጽ አገልግሎቶች የሚጠቀሙ ሌሎች ሥርዓቶች ይጠቀሙበታል)፤ የይለፍ ቃል መጠየቂያ ጊዜ ስለማለፍ የሚበጀው የይለፍ ቃል ማለፊያ ቀናት ሥርዓት ማስተካከያ በመጠቀም ነው ');


ALTER TABLE approle ENABLE TRIGGER ALL;

--
-- Data for Name: br_severity_type; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE br_severity_type DISABLE TRIGGER ALL;

INSERT INTO br_severity_type (code, display_value, status, description) VALUES ('critical', 'Critical::::Критичное::::حرج::::Critique::::ወሳኝ', 'c', '...::::::::...::::...::::...');
INSERT INTO br_severity_type (code, display_value, status, description) VALUES ('medium', 'Medium::::Среднее::::متوسط::::Moyen::::መካከለኛ', 'c', '...::::::::...::::...::::...');
INSERT INTO br_severity_type (code, display_value, status, description) VALUES ('warning', 'Warning::::Предупреждение::::تحذير::::Alerte::::ማስጠንቀቂያ', 'c', '...::::::::...::::...::::...');


ALTER TABLE br_severity_type ENABLE TRIGGER ALL;

--
-- Data for Name: br_technical_type; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE br_technical_type DISABLE TRIGGER ALL;

INSERT INTO br_technical_type (code, display_value, status, description) VALUES ('sql', 'SQL::::SQL::::SQL::::SQL::::ሲኮል', 'c', 'The rule definition is based in sql and it is executed by the database engine.::::The rule definition is based in sql and it is executed by the database engine.::::...::::La définition de la règle est basée en SQL et est exécutée par le moteur de la base de donnée.::::የደንቡ ትርጓሜ የተመሠረተው ኤስኪውኤል ውስጥ ነው እና የሚፈጸመው በዳታቤዝ ኢንጂን አማካኝነት ነው');
INSERT INTO br_technical_type (code, display_value, status, description) VALUES ('drools', 'Drools::::Drools::::Drools::::Drools::::ድሩልስ', 'c', 'The rule definition is based on Drools engine.::::The rule definition is based on Drools engine.::::...::::La définition de la règle est basée sur le moteur Drools.::::የደንቡ ትርጓሜ የተመሠረተው በድሩልስ ኢንጅን ነው');


ALTER TABLE br_technical_type ENABLE TRIGGER ALL;

--
-- Data for Name: br_validation_target_type; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE br_validation_target_type DISABLE TRIGGER ALL;

INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('bulkOperationSpatial', 'BUlk operation::::Массовая Операция::::رزمة عمليات::::Opération en masse::::ጅምላ ኦፕሬሽን', 'c', 'The target of the validation is the transaction related with the bulk operations.::::Объектом проверки является транзакция, отосящаяся к массовым операциям.::::...::::La cible de la validation est la transaction liée à l''opération en masse.::::ማረጋገጫውን የሚመለከተው ተግባር ከጥቅል ኦፕሬሽን ጋር የተያያዘ ነው ');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('application', 'Application::::Заявление::::الطلب::::Demande::::ማመልከቻ', 'c', 'The target of the validation is the application. It accepts one parameter {id} which is the application id.::::Объектом проверки является заявление. Имеется один входной параметр - {id} который является id заявления.::::...::::LA cible de la validation est la demande. Elle accepte un paramètre {id} qui est le numéro d''identification de la demande.::::ማረጋገጫውን የሚመለከተው ማመልከቻውን ነው፡፡ አንድ መመዘኛ (አይዲ) ይቀበላል፤ ይህም የሚመለከታቸው አይዲ ነው');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('service', 'Service::::Услуга::::خدمة::::Service::::የአገልግሎት', 'c', 'The target of the validation is the service. It accepts one parameter {id} which is the service id.::::Объектом проверки является услуга. Имеется один входной параметр - {id} который является id услуги.::::...::::La cible de la validation est le service. Elle accepte un paramètre {id} qui est le numéro d''identification du service.::::ማረጋገጫውን የሚመለከታቸው አገልግሎቱን ነው፤ አንድ መመዘኛ ይቀበላል (አይዲ) ይህም የአገልግሎቱ አይዲ ነው');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('rrr', 'Right or Restriction::::Право или Ограничение::::حق أو قيد::::Droit ou Restriction::::መብት ወይም ገደብ', 'c', 'The target of the validation is the rrr. It accepts one parameter {id} which is the rrr id. ::::Объектом проверки является право. Имеется один входной параметр - {id} который является id права.::::...::::La cible de la validation est le RRR. Elle accepte un paramètre {id} qui est le numéro d''identification du RRR.::::ማረጋገጫውን የሚመለከተው መገኃ ነው አንድ መለኪያ ይቀበላል (አይዲ) ይህም የመገኃ አይዲ ነው');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('state_land', 'State Land Parcel::::::::::::::::የመንግስት ቁራሽ መሬት ', 'c', 'Identifies business rules to execute when creating or changing State Land Parcels. These rules accept the transaction id as a parameter.::::::::::::::::የመንግስት ቁራሽ መሬቶች ሲበጁ ወይም ሲለወጡ ሥራ ላይ መዋል ያለባቸው የቢዝነስ ደንቦች ይለያል፤ እነዚህ ደንቦች የልውውጡን አይዲ እንደመለኪያ ይቀበላሉ');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('ba_unit', 'Administrative Unit::::Единица Недвижимости::::وحدة ادارية::::Unité Administrative::::የአስተዳደር አካል', 'c', 'The target of the validation is the ba_unit. It accepts one parameter {id} which is the ba_unit id.::::Объектом проверки является единица недвижимости. Имеется один входной параметр - {id} который является id недвижимости.::::...::::La cible de la validation est la ba_unit, l''unité adminstrative de base. Elle accepte un paramètre {id} qui est le numéro d''identification de l''unité administrative ba_unit id.::::ማረጋገጫውን የሚመለከተው የቢኤ_አሀድ ነው፤ አንድ መመዘኛ (አይዲ) ይቀበላል፤ ይህም የቢኤ_አሃድ አይዲ ነው');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('source', 'Source::::Документ::::المصدر::::Source::::ምንጭ', 'c', 'The target of the validation is the source. It accepts one parameter {id} which is the source id.::::Объектом проверки является документ. Имеется один входной параметр - {id} который является id документа.::::...::::La cible de la validation est la source. Elle accepte un paramètre {id} qui est le numéro d''identification de la source.::::ማረጋገጫውን የሚመለከተው ምንጩን ነው፤ አንድ መመዘኛ ይቀበላል (አይዲ) ይህም የምንጩ አይዲ ነው');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('cadastre_object', 'Cadastre Object::::Кадастровый Объект::::كائن مساحة::::Objet Cadastre::::ካዳሰተር ኦብጄክት', 'c', 'The target of the validation is the transaction related with the cadastre change. It accepts one parameter {id} which is the transaction id.::::Объектом проверки является кадастровый объект. Имеется один входной параметр - {id} который является id транзакции.::::هدف التحقق من صحة الحركة فحص التغيير على الكائن الممسوح::::La cible de la validation est la transaction liée à la modification du cadastre. Elle accepte un paramètre {id} qui est le numéro d''identification de la transaction.::::ማረጋገጫውን የሚመለከተው ከካዳስተር ለውጥ ጋር የተያያዘው ተግባር ነው፤ አንድ መመዘኛ ይቀበላል (አይዲ) ይህም የተግባሩ አይዲ ነው ');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('consolidation', 'Consolidation::::Consolidation::::Consolidation::::Consolidation::::ማጣመር', 'c', 'The target of the validation are the records to be consolidated::::The target of the validation are the records to be consolidated::::...::::The target of the validation are the records to be consolidated::::ማረጋገጫውን የሚመለከታቸው የሚጣመሩ መዛግብትን ነው');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('spatial_unit_group', 'Spatial unit group::::Пространственная группа::::مجموعة الوحدات المكانية::::Groupe d''Unité Spatiale::::የቦታ አሀድ ስብስብ', 'c', 'The target of the validation are the spatial unit groups::::Объектом проверки является пространственные группы::::...::::La cible de la validation sont les groupes d''unité spatiale::::ማረጋገጫውን የሚመለከታቸው የቦታው አሀድ ቡድኖችን ነው  ');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('public_display', 'Public display::::Публичный показ::::أظهار عام::::Affichage Public::::ለሕዝብ ማሳያ ', 'c', 'The target of the validation is the set of cadastre objects/ba units that belong to a certain last part. It accepts one parameter {lastPart} which is the last part.::::Объектом проверки является комбинация кадастрового объекта и ед. недвижимости содержащих одинакокую последнюю часть идентификационного кода. Имеется один входной параметр - {lastPart} который является последней частью идентификационного кода.::::...::::La cible de la validation est le lot d''objets cadastre / d''unités administratives qui appartiennent à une certaine dernière partie. Elle accepte un paramètre {lastpart} qui est la dernière partie.::::ማረጋገጫውን የተመለከተው የካዳስተር ኦብጀክትስ ስብስብ/ቢኤ አሀዶች አንድ የመጨረሻ ክፍል ነው፤ አንድ መመዘኛ ይቀበላል (የመጨረሻ ክፍል) ይህም የመጨረሻ ክፍል ነው');


ALTER TABLE br_validation_target_type ENABLE TRIGGER ALL;

--
-- Data for Name: language; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE language DISABLE TRIGGER ALL;

INSERT INTO language (code, display_value, active, is_default, item_order, ltr) VALUES ('am-ET', 'ኣማርኛ', true, false, 5, true);
INSERT INTO language (code, display_value, active, is_default, item_order, ltr) VALUES ('ru-RU', 'Русский::::::::::::::::የሩስያ', false, false, 2, true);
INSERT INTO language (code, display_value, active, is_default, item_order, ltr) VALUES ('fr-FR', 'Français::::::::::::::::የፈረንሳይኛ', false, false, 4, true);
INSERT INTO language (code, display_value, active, is_default, item_order, ltr) VALUES ('en-US', 'English::::::::::::::::የእንግሊዝኛ', true, true, 1, true);
INSERT INTO language (code, display_value, active, is_default, item_order, ltr) VALUES ('ar-JO', 'عربي::::::::::::::::የአረብኛ', false, false, 3, false);


ALTER TABLE language ENABLE TRIGGER ALL;

SET search_path = transaction, pg_catalog;

--
-- Data for Name: reg_status_type; Type: TABLE DATA; Schema: transaction; Owner: postgres
--

ALTER TABLE reg_status_type DISABLE TRIGGER ALL;

INSERT INTO reg_status_type (code, display_value, description, status) VALUES ('historic', 'Historic::::История::::تاريخي::::Historique::::ታሪካዊ', '...::::::::...::::...::::...', 'c');
INSERT INTO reg_status_type (code, display_value, description, status) VALUES ('pending', 'Pending::::На исполнении::::قيد الانتظار::::En attente::::በእንጥልጥል ላይ', '...::::::::...::::...::::...', 'c');
INSERT INTO reg_status_type (code, display_value, description, status) VALUES ('previous', 'Previous::::Предыдущий::::السابق::::Précédent::::ቀድሞ', '...::::::::...::::...::::...', 'c');
INSERT INTO reg_status_type (code, display_value, description, status) VALUES ('current', 'Current::::Текущий::::الحالي::::Courant::::ወቅታዊ', '...::::::::...::::...::::...', 'c');


ALTER TABLE reg_status_type ENABLE TRIGGER ALL;

--
-- Data for Name: transaction_status_type; Type: TABLE DATA; Schema: transaction; Owner: postgres
--

ALTER TABLE transaction_status_type DISABLE TRIGGER ALL;

INSERT INTO transaction_status_type (code, display_value, description, status) VALUES ('approved', 'Approved::::Одобрено::::موافق عليه::::Approuvé::::ተፈቅዷል', '', 'c');
INSERT INTO transaction_status_type (code, display_value, description, status) VALUES ('cancelled', 'Cancelled::::Отменено::::ملغى::::Annulé::::ተሰርዟል', '', 'c');
INSERT INTO transaction_status_type (code, display_value, description, status) VALUES ('pending', 'Pending::::Незавершено::::معلق::::En attente::::በእንጥልጥል ላይ', '', 'c');
INSERT INTO transaction_status_type (code, display_value, description, status) VALUES ('completed', 'Completed::::Завершено::::مكتمل::::Exécuté::::ተጠናቋል', '', 'c');


ALTER TABLE transaction_status_type ENABLE TRIGGER ALL;

--
-- PostgreSQL database dump complete
--

