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

INSERT INTO ba_unit_rel_type (code, display_value, description, status) VALUES ('priorTitle', 'Prior Title::::Предыдущая недвижимость::::سند الملكية السابق::::Titre précédent', 'Prior Title::::Предыдущая недвижимость::::...::::Titre précédent', 'x');
INSERT INTO ba_unit_rel_type (code, display_value, description, status) VALUES ('rootTitle', 'Root of Title::::Корневая недвижимость::::أصل  سند الملكية::::Racine du Titre', 'Root of Title::::Корневая недвижимость::::...::::Racine du Titre', 'x');
INSERT INTO ba_unit_rel_type (code, display_value, description, status) VALUES ('underlyingTitle', 'Underlying Title', 'The title from which the state land was taken.', 'c');
INSERT INTO ba_unit_rel_type (code, display_value, description, status) VALUES ('island', 'Island', 'The property is within an island.', 'c');
INSERT INTO ba_unit_rel_type (code, display_value, description, status) VALUES ('settlement', 'Settlement', 'The property is within a settlement or village.', 'c');
INSERT INTO ba_unit_rel_type (code, display_value, description, status) VALUES ('claimed', 'Claimed Land', 'The property is on an area of reclaimed land.', 'c');


ALTER TABLE ba_unit_rel_type ENABLE TRIGGER ALL;

--
-- Data for Name: ba_unit_type; Type: TABLE DATA; Schema: administrative; Owner: postgres
--

ALTER TABLE ba_unit_type DISABLE TRIGGER ALL;

INSERT INTO ba_unit_type (code, display_value, description, status) VALUES ('administrativeUnit', 'Administrative Unit::::Административная единица::::وحدة ادارية::::Unité Administrative', '...::::::::...::::...', 'x');
INSERT INTO ba_unit_type (code, display_value, description, status) VALUES ('leasedUnit', 'Leased Unit::::Единица для Аренды::::وحدة  مؤجرة::::Unité de Bail', '...::::::::...::::...', 'x');
INSERT INTO ba_unit_type (code, display_value, description, status) VALUES ('propertyRightUnit', 'Property Right Unit::::Единица права недвижимости::::وحدة حقوق الملكية::::Unité de Droit de Propriété', '...::::::::...::::...', 'x');
INSERT INTO ba_unit_type (code, display_value, description, status) VALUES ('stateLand', 'State Land', 'State land property type', 'c');
INSERT INTO ba_unit_type (code, display_value, description, status) VALUES ('basicPropertyUnit', 'Property', 'This is the basic property unit that is used by default::::Это базовая единица недвижимости используемая по умолчанию::::...::::Ceci est l''unité de base de propriété utilisée par défaut', 'c');


ALTER TABLE ba_unit_type ENABLE TRIGGER ALL;

--
-- Data for Name: condition_type; Type: TABLE DATA; Schema: administrative; Owner: postgres
--

ALTER TABLE condition_type DISABLE TRIGGER ALL;

INSERT INTO condition_type (code, display_value, description, status) VALUES ('c1', '1. Fence Boundaries', 'Unless the Minister directs otherwise the Lessee shall fence the boundaries of the land within 6 (six) months of the date of the grant and the Lessee shall maintain the fence to the satisfaction of the Commissioner.::::Unless the Minister directs otherwise the Lessee shall fence the boundaries of the land within 6 (six) months of the date of the grant and the Lessee shall maintain the fence to the satisfaction of the Commissioner.::::ما لم يقرر الوزير غير ذلك  على المستأجر تسسيج حدود الارض بمدة لا تزيد عن 6 شهورمن تاريخ السماح ويجب على المستاجر المحافظة على سلامة السياج لصالح المفوض::::A moins que le Ministre n''ordonne d''autres directives, le preneur de bail doit clôturer les limites du terrain dans les 6 (six) mois suivant la date d''obtention du bail et le preneur de bail doit entretenir la clôture selon la satisfaction du Commissaire.', 'c');
INSERT INTO condition_type (code, display_value, description, status) VALUES ('c2', '2. Development of Land', 'Unless special written authority is given by the Commissioner, the Lessee shall commence development of the land within 5 years of the date of the granting of a lease. This shall also apply to further development of the land held under a lease during the term of the lease.::::Unless special written authority is given by the Commissioner, the Lessee shall commence development of the land within 5 years of the date of the granting of a lease. This shall also apply to further development of the land held under a lease during the term of the lease.::::ما لم يصدر مرسوم رسمي عن المفوض , على المستأجر البدء يتطوير الارض خلال 5 سنوات من تاريخ  الاستئجار. كما ينطبق ذلك على التطوير الاضافي للارض الواقعى ضمن بنود الاستئجار::::A moins que le Commissaire de donne des pouvoirs spéciaux par écrit, le preneur de bail doit commencer le développement du terrain dans les 5 ans suivant la date d''obtention du bail. Ceci doit aussi s''appliquer à d''autres développement du terrain tenu à bail pendant la durée du bail.', 'c');
INSERT INTO condition_type (code, display_value, description, status) VALUES ('c3', '3. Drainage and Sewerage', 'Within a period of the time to be fixed by the planning authority, the Lessee shall provide at his own expense main drainage or main sewerage connections from the building erected on the land as the planning authority may require.::::Within a period of the time to be fixed by the planning authority, the Lessee shall provide at his own expense main drainage or main sewerage connections from the building erected on the land as the planning authority may require.::::ضمن المدة المحددة من سلطة التخطيط, على المستأجر التمديد على حسابه وصلات الصرف الصحي وصرف المياه من البناية المرفوعة على الارض بما يتوافق مع متطلبات سلطة التخطيط::::Pendant la période de temps fixée par les autorités en charge de l''urbanisme, le preneur de bail doit fournir à ses propres frais une évacuation des eaux usées ou un raccordement au réseau d''évacuation des beaux usées depuis le bâtiment érigé sur le terrain selon les conditions des autorités en charge de l''urbanisme.', 'c');
INSERT INTO condition_type (code, display_value, description, status) VALUES ('c4', '4. Use of Land', 'The Lessee shall use the land comprised in the lease only for the purpose specified in the lease or in any variation made to the original lease.::::The Lessee shall use the land comprised in the lease only for the purpose specified in the lease or in any variation made to the original lease.::::على المستاجر استخدام الارض فقط للاغراض المنصوص عليها في عقد الايجار او أي تغييرات مرفقة مع عقد الايجار::::Le preneur de bail doit utiliser le terrain compris dans le bail seulement pour l''objet spécifié dans bail ou dans une variation effectuée au bail d''origine.', 'c');
INSERT INTO condition_type (code, display_value, description, status) VALUES ('c5', '5. Planning Authority Access', 'Save with the written authority of the planning authority, no electrical power or telephone pole or line or water, drainage or sewer pipe being upon or passing through, over or under the land and no replacement thereof, shall be moved or in any way be interfered with and reasonable access thereto shall be preserved to allow for inspection, maintenance, repair, renewal and replacement.::::Save with the written authority of the planning authority, no electrical power or telephone pole or line or water, drainage or sewer pipe being upon or passing through, over or under the land and no replacement thereof, shall be moved or in any way be interfered with and reasonable access thereto shall be preserved to allow for inspection, maintenance, repair, renewal and replacement.::::محفوظة بشكل خطي عند سلطة التخطيط , جميع خطوط الطاقة الكهربائية أو قطب الهاتف أو خط المياه والصرف الصحي أو أنابيب المجاري التي تجري على الارض او و تمر، فوق أو تحت الأرض لا يجب استبدال أي منها، او نقلها في أي حال من الأحوال ويجب الحفاظ عليها وضمان صول معقول للسماح للتفتيش والصيانة والإصلاح والتجديد والاستبدال::::Sauvegarder en écrit de la part des autorités de l''urbanisme, pas de courant électrique ou de poteau de téléphone ou d''évacuation d''égout passant au-dessus ou à travers, au-dessus ou en-dessous du terrain et pas de remplacement, ne doit pas être déplacé ou interférer avec l''accès, doit être préservé pour rendre possible l''inspection, l''entretien, la réparation, le renouvellement ou le déplacement.', 'c');
INSERT INTO condition_type (code, display_value, description, status) VALUES ('c6', '6. Building Repair and Maintenance', 'The interior and exterior of any building erected on the land and all building additions thereto and all other buildings at any time erected or standing on the land and walls, drains and other appurtenances, shall be kept by the Lessee in good repair and tenantable condition to the satisfaction of the planning authority.::::The interior and exterior of any building erected on the land and all building additions thereto and all other buildings at any time erected or standing on the land and walls, drains and other appurtenances, shall be kept by the Lessee in good repair and tenantable condition to the satisfaction of the planning authority.::::جميع مداخل ومخارج البنايات المرفوعة على الارض وجميع البنايات المرفوعة على الارض في أي وقت والجدران والمصارف والتوابع , يجب الحفاظ عليها بصورة جيدة وتصليحها بما يحقق متطلبات سلطة التخطيط::::Les intérieurs et extérieurs des bâtiments érigés sur le terrain and tous les ajouts et autres bâtiments érigés à n''importe quel moment ou en cours de réalisation, ainsi que les murs, drains ou autres équipements, doivent être entretenus par le teneur de bail en bon état de location à la satisfaction des autorités d''urbanisme.', 'c');
INSERT INTO condition_type (code, display_value, description, status) VALUES ('c7', '7. Removal of Contaminants', 'Any contaminants idenitified by the planning authority are to be removed and the land restored to is original state within 12 months from the begining of the lease.', 'c');


ALTER TABLE condition_type ENABLE TRIGGER ALL;

--
-- Data for Name: mortgage_type; Type: TABLE DATA; Schema: administrative; Owner: postgres
--

ALTER TABLE mortgage_type DISABLE TRIGGER ALL;

INSERT INTO mortgage_type (code, display_value, description, status) VALUES ('levelPayment', 'Level Payment::::Многоуровневый платеж::::دفعات متدرجة::::Niveau de Paiement', '...::::::::...::::...', 'c');
INSERT INTO mortgage_type (code, display_value, description, status) VALUES ('linear', 'Linear::::Линейный::::خطي::::Linéaire', '...::::::::...::::...', 'c');
INSERT INTO mortgage_type (code, display_value, description, status) VALUES ('microCredit', 'Micro Credit::::Микро кредит::::القروض الصغيرة::::Micro Crédit', '...::::::::...::::...', 'c');


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

INSERT INTO rrr_group_type (code, display_value, description, status) VALUES ('responsibilities', 'Responsibilities::::Ответственность::::المسؤوليات::::Responsabilités', '...::::::::...::::...', 'x');
INSERT INTO rrr_group_type (code, display_value, description, status) VALUES ('restrictions', 'Restrictions::::Ограничения::::القيود::::Restrictions', '...::::::::...::::...', 'c');
INSERT INTO rrr_group_type (code, display_value, description, status) VALUES ('rights', 'Rights::::Права::::الحقوق::::Droits', '...::::::::...::::...', 'c');


ALTER TABLE rrr_group_type ENABLE TRIGGER ALL;

--
-- Data for Name: rrr_type; Type: TABLE DATA; Schema: administrative; Owner: postgres
--

ALTER TABLE rrr_type DISABLE TRIGGER ALL;

INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('mortgage', 'restrictions', 'Mortgage::::Ипотека::::الرهن::::Hypothèque', false, true, true, '...::::::::...::::...', 'x', 'mortgage');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('apartment', 'rights', 'Apartment Ownership::::Право собственности на квартиру::::مالك الشقة::::Propriété d''Appartement', true, true, true, 'Extension to LADM::::Расширение LADM::::...::::...', 'x', 'ownership');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('fishing', 'rights', 'Fishing Right::::Рыболовное право::::حق الصيد::::Droit de pêche', false, true, true, '...::::::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('tenancy', 'rights', 'Tenancy::::Арендаторство::::استئجار عقار::::Tenure', true, true, true, '...::::::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('lifeEstate', 'rights', 'Life Estate::::Пожизненное право собственности::::عقار مدى الحياة::::Donation au dernier vivant', true, true, true, 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('customaryType', 'rights', 'Customary Right::::Традиционное право::::الحق العرفي::::Droit Coutumier', false, true, true, '...::::::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('monument', 'restrictions', 'Monument::::Памятник::::النصب::::Monument', false, true, true, '...::::::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('grazing', 'rights', 'Grazing Right::::Право выпаса::::حق الرعي::::Droit de Pacage', false, true, true, '...::::::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('ownershipAssumed', 'rights', 'Ownership Assumed::::Принятое право собственности::::افتراض الملكية::::Propriété supposée', true, true, true, '...::::::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('usufruct', 'rights', 'Usufruct::::Право использования для сбора урожая::::حق الانتفاع::::Usufruit', false, true, true, '...::::::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('waterrights', 'rights', 'Water Right::::Право на водные ресурсы::::حق في المياه::::Droit d''Eau', false, true, true, '...::::::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('caveat', 'restrictions', 'Caveat::::Арест::::القيود::::Caveat', false, true, true, 'Extension to LADM::::Расширение LADM::::...::::Extension du LADM', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('adminPublicServitude', 'restrictions', 'Administrative Public Servitude::::Административный публичный сервитут::::حق الاستخدام العام::::Servitude Publique Administrative', false, true, true, '...::::::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('commonOwnership', 'rights', 'Common Ownership::::Общая собственность::::الملكية العامة::::Propriété Commune', false, true, true, '...::::::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('superficies', 'rights', 'Superficies::::Superficies::::بناء متعدي::::Superficies', false, true, true, '...::::::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('agriActivity', 'rights', 'Agriculture Activity::::Сельскохозяйственная деятельность::::نشاط زراعي::::Activité Agricole', false, true, true, '...::::::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('firewood', 'rights', 'Firewood Collection::::Сбор древисины::::...::::Collecte Bois à brûler', false, true, true, '...::::::::...::::...', 'x', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('noBuilding', 'restrictions', 'Building Restriction::::Ограничение на здание::::قيود على بناية::::Restriction Bâtiment', false, false, false, '...::::::::...::::...', 'x', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('monumentMaintenance', 'responsibilities', 'Monument Maintenance::::Обслуживание памятника::::صيانة النصب::::Entretien Monument', false, false, false, '...::::::::...::::...', 'x', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('limitedAccess', 'restrictions', 'Limited Access (to Road)::::Ограниченный доступ к дороге::::استعمال محدود للطريق::::Accès Limité (à la Route)', false, false, false, 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM', 'x', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('informalOccupation', 'rights', 'Informal Occupation::::Неформальная оккупация::::الاستعمال الغير رسمي::::Occupation informelle', false, false, false, '...::::::::...::::...', 'x', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('historicPreservation', 'restrictions', 'Historic Preservation::::Историческая резервация::::الحفظ التاريخي::::Préservation Historique', false, false, false, 'Extension to LADM::::Расширение LADM::::...::::...', 'x', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('waterwayMaintenance', 'responsibilities', 'Waterway Maintenance::::Обслуживания каналов ирригации::::صيانة الممر المائي::::Entretien Voie Navigable', false, false, false, '...::::::::...::::...', 'x', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('occupation', 'rights', 'Occupation::::Оккупация::::الاستعمال::::Occupation', false, false, true, 'General occupation of land by an individual or group that may be informal, traditional or illegal.', 'c', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('lease', 'rights', 'Lease::::Аренда::::الايجار::::Bail', false, false, true, 'Lease of property possibly subject to conditions.', 'c', 'lease');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('ownership', 'rights', 'Owner', true, true, true, 'The owner of a property.', 'c', 'ownership');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('servitude', 'restrictions', 'Easement', false, false, false, 'An easement over a property for general access, roading, water or power transmission.', 'c', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('stateOwnership', 'rights', 'State Landholder', true, false, true, 'State agency or other state organisation that has the primary responsiblity for managing and using the land.', 'c', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('liability', 'responsibilities', 'Liability', false, false, false, 'Indicates the land is subject to some form of liability such as contamination, erosision or instability.', 'c', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('license', 'rights', 'License', false, false, true, 'Indicates that a license, usually for a specific purpose such has mining, grazing, forestry, etc, has been granted.', 'c', 'lease');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('claim', 'restrictions', 'Claim', false, false, true, 'Indicates an individual or group has a claim over the property.', 'c', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('landbank', 'restrictions', 'Landbank', false, false, false, 'Indicates the land is part of a landbank and is likely to be disposed of at some point.', 'c', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('heritage', 'responsibilities', 'Heritage', false, false, false, 'Indicates the land contains a heritage site that has historical, cultural, archaelogical or natural/environmental significance.', 'c', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('customary', 'rights', 'Customary', false, false, true, 'Indicates the land is subject to customary title and related activities such as food gathering. ', 'c', 'simpleRightholder');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('condition', 'responsibilities', 'Condition', false, false, false, 'Indicates that conditions have been imposed on the states ownership of the land (e.g. specific disposal conditions, etc).', 'c', 'simpleRightCondPanel');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('restriction', 'restrictions', 'Restriction', false, false, false, 'Restriction imposed on the property usually by local government bodies such as building and/or water taking restrictions.', 'c', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('notice', 'restrictions', 'Notice', false, false, false, 'Public or legal notices that have been issued in relation to the property such as noticies for trespass, littering or rubbish dumping, etc.', 'c', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('rsensitivity', 'restrictions', 'Reverse Sensitivity', false, false, false, 'Indicates that in a mixed use area, once a particular use for land is established (e.g. road or highway), any new uses for surronding property (e.g. residential development) cannot impose restrictions on the established use.', 'c', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('order', 'restrictions', 'Order', false, false, false, 'An order issued by the court or a decision from a tribunal or other judicial authority that imposes a specific action on the property (e.g. transfer from one owner to another or a demolition order, etc.', 'c', 'simpleRight');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status, rrr_panel_code) VALUES ('ppp', 'rights', 'Public Private Partnership', false, false, true, 'Indicates that the state has entered into a public private partnership along with any coniditions relating to that partnership.', 'c', 'simpleRholdConPanel');


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

INSERT INTO valuation_type (code, display_value, description, status) VALUES ('mass', 'Mass', 'Property value has been determined through a mass valuation process', 'c');
INSERT INTO valuation_type (code, display_value, description, status) VALUES ('market', 'Market', 'The value the property will likely trade for between a willing buyer and willing seller as at the valuation date.', 'c');
INSERT INTO valuation_type (code, display_value, description, status) VALUES ('valueInUse', 'Value In Use', 'Represents the cash flow generated for a specific owner under a specific use.', 'c');
INSERT INTO valuation_type (code, display_value, description, status) VALUES ('investment', 'Investment Value', 'The value of the property to an owner or prospective owner for investment or operational objectives', 'c');
INSERT INTO valuation_type (code, display_value, description, status) VALUES ('insurable', 'Insurable Value', 'Property value for insurance purposes. Excludes site value.', 'c');
INSERT INTO valuation_type (code, display_value, description, status) VALUES ('liquidation', 'Liquidation Value', 'Property value where the owner is compelled to sell due to bankruptcy or forced sale.', 'c');


ALTER TABLE valuation_type ENABLE TRIGGER ALL;

SET search_path = application, pg_catalog;

--
-- Data for Name: application_status_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE application_status_type DISABLE TRIGGER ALL;

INSERT INTO application_status_type (code, display_value, status, description) VALUES ('lodged', 'Lodged::::Подано::::مودع::::Déposée', 'c', 'Application has been lodged and officially received by land office::::Заявление подано и официально принято регистрационным офисом::::Application has been lodged and officially received by land office::::La demande a été déposée et officiellement reçue par l''Officier d''Etat');
INSERT INTO application_status_type (code, display_value, status, description) VALUES ('approved', 'Approved::::Одобрено::::موافق عليه::::Approuvée', 'c', '');
INSERT INTO application_status_type (code, display_value, status, description) VALUES ('annulled', 'Annulled::::Аннулировано::::ملغى::::Annulée', 'c', '');
INSERT INTO application_status_type (code, display_value, status, description) VALUES ('completed', 'Completed::::Завершено::::مكتمل::::Exécutée', 'c', '');
INSERT INTO application_status_type (code, display_value, status, description) VALUES ('requisitioned', 'On Hold', 'c', '');


ALTER TABLE application_status_type ENABLE TRIGGER ALL;

--
-- Data for Name: application_action_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE application_action_type DISABLE TRIGGER ALL;

INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('addDocument', 'Add document::::Добавлен документ::::اضافة وثيقة::::Ajouter Document', NULL, 'c', 'Scanned Documents linked to Application (action is automatically logged when a new document is saved)::::Добавление документа к заявлению::::Scanned Documents linked to Application (action is automatically logged when a new document is saved)::::Les documents scannés sont liés à la demande (l''action est automatiquement déposée quand un nouveau document est sauvegardé)');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('dispatch', 'Dispatch::::Отослано::::توزيع::::Envoyer', NULL, 'c', 'Application documents and new land office products are sent or collected by applicant (action is manually logged)::::Документы заявления отсылаются заявителю или он забирает их сам::::Application documents and new land office products are sent or collected by applicant (action is manually logged)::::Les documents de demande et les produits du nouveau bureau du foncier sont envoyés à ou collecté par le demandeur (l''action est manuellement déposée)');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('validateFailed', 'Quality Check Fails::::Проверка качества вернула ошибки::::فشلت عملية التحقق::::Le Contrôle Qualité a échoué', NULL, 'c', 'Quality check fails (automatically logged when a critical business rule failure occurs)::::Ошибки при проверки качества будут автоматически записаны в лог системы::::Quality check fails (automatically logged when a critical business rule failure occurs)::::Le Contrôle Qualité a échoué (automatiquement déposé  quand un échec de règle métier critique se produit)');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('approve', 'Approve::::Одобрено::::الموافقة::::Approver', 'approved', 'c', 'Application is approved (automatically logged when application is approved successively)::::Заявление одобрено::::Application is approved (automatically logged when application is approved successively)::::La demande est approuvée (automatiquement déposé  quand la demande est approuvée avec succès)');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('validatePassed', 'Quality Check Passes::::Успешная проверка качества::::عملية التحقق تمت بنجاح::::Le Contrôle Qualité a réussi', NULL, 'c', 'Quality check passes (automatically logged when business rules are run without any critical failures)::::Успешная проверка качества::::Quality check passes (automatically logged when business rules are run without any critical failures)::::Le Contrôle Qualité a réussi (automatiquement déposé  quand des règles métier sont passées sans erreur critique)');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('cancel', 'Cancel application::::Отменено::::الغاء طلب::::Annuler Demande', 'annulled', 'c', 'Application cancelled by Land Office (action is automatically logged when application is cancelled)::::Отмена исполнения заявления::::Application cancelled by Land Office (action is automatically logged when application is cancelled)::::La demande est annulée par l''Officier d''Etat (l''action est automatiquement déposée quand la demande est annulée)');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('archive', 'Archive::::Помещено в архив::::ارشفة::::Archiver', 'completed', 'c', 'Paper application records are archived (action is manually logged)::::Отправление в архив бумажной копии заявления::::Paper application records are archived (action is manually logged)::::Les papiers de demande  sont archivés (l''action est manuellement déposée)');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('assign', 'Assign::::Назначено::::تعيين::::Assigner', NULL, 'c', '');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('validate', 'Validate::::Проверено::::التحقق من صحة البيانات::::Valider', NULL, 'c', 'The action validate does not leave a mark, because validateFailed and validateSucceded will be used instead when the validate is completed.::::The action validate does not leave a mark, because validateFailed and validateSucceded will be used instead when the validate is completed.::::The action validate does not leave a mark, because validateFailed and validateSucceded will be used instead when the validate is completed.::::L''action valider ne laisse pas de trace car Erreur de Validation (validateFailed) et Succès de Validation (validateSucceded) seront utilisés quand la validation est exécutée.');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('unAssign', 'Unassign::::Освобождено::::الغاء تعيين::::Retirer', NULL, 'c', '');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('lodge', 'Lodgement Notice Prepared::::Подготовлено уведомление об оплате::::تم تحضير ملاحظة الايداع::::Notice de dépôt préparée', 'lodged', 'c', 'Lodgement notice is prepared (action is automatically logged when application details are saved for the first time::::Подготовлено уведомление об оплате::::Lodgement notice is prepared (action is automatically logged when application details are saved for the first time::::La notice de dépôt set préparée (l''action est automatiquement déposée quand les détails de la demande sont sauvegardé pour la première fois)');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('lapse', 'Lapse::::Помечено как устарешее::::مضى عليه زمن::::Erreur', 'annulled', 'c', '');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('withdraw', 'Withdraw application::::Забрано::::اسحب الطلب::::Retirer Demande', 'annulled', 'c', 'Application withdrawn by Applicant (action is manually logged)::::Заявление было забрано заявителем::::Application withdrawn by Applicant (action is manually logged)::::Demande retirée par le demandeur (l''action est automatiquement déposée)');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('addSpatialUnit', 'Add spatial unit::::Add spatial unit::::Add spatial unit::::Add spatial unit', NULL, 'c', '');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('requisition', 'Hold', 'requisitioned', 'c', 'Further information requested from applicant (action is manually logged)::::Дальнейшая информация запрошена у заявителя::::Further information requested from applicant (action is manually logged)::::Plus d''informations requises de la part du demandeur (l''action est automatiquement déposée)');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('resubmit', 'Resume', 'lodged', 'c', '');


ALTER TABLE application_action_type ENABLE TRIGGER ALL;

--
-- Data for Name: authority; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE authority DISABLE TRIGGER ALL;

INSERT INTO authority (code, display_value, description, status) VALUES ('mediator', 'Mediator', 'A mediator is being used to help resolve the dispute or objection.', 'c');
INSERT INTO authority (code, display_value, description, status) VALUES ('court', 'Court', 'A court is being used to help resolve the dispute or objection.', 'c');
INSERT INTO authority (code, display_value, description, status) VALUES ('tribunal', 'Tribunal', 'A tribunal is being used to help resolve the dispute or objection.', 'c');


ALTER TABLE authority ENABLE TRIGGER ALL;

--
-- Data for Name: checklist_group; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE checklist_group DISABLE TRIGGER ALL;

INSERT INTO checklist_group (code, display_value, description, status) VALUES ('compulsory', 'Compulsory Acquisition', 'Items to confirm when using compulsory powers to acquire new land for state purposes', 'c');
INSERT INTO checklist_group (code, display_value, description, status) VALUES ('voluntary', 'Voluntary Acquisition', 'Items to confirm when using voluntary powers to acquire new land for state purposes', 'c');
INSERT INTO checklist_group (code, display_value, description, status) VALUES ('lease', 'Lease', 'Items to confirm when leasing new land for state purposes', 'c');


ALTER TABLE checklist_group ENABLE TRIGGER ALL;

--
-- Data for Name: checklist_item; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE checklist_item DISABLE TRIGGER ALL;

INSERT INTO checklist_item (code, display_value, description, status, display_order) VALUES ('landIdentified', 'Land Identified', 'All land affected by the proposed works has been identified ', 'c', 10);
INSERT INTO checklist_item (code, display_value, description, status, display_order) VALUES ('publishPlan', 'Publish Plan', 'The plan outlining the requirements for land to be acquired has been published', 'c', 20);
INSERT INTO checklist_item (code, display_value, description, status, display_order) VALUES ('notifyLandholders', 'Notify Landholders', 'All affected landholders and adjoining landholders have been notified of the works to be undertaken.', 'c', 30);
INSERT INTO checklist_item (code, display_value, description, status, display_order) VALUES ('consents', 'Consents', 'Any planning consents for the proposed works have been obtained from the appropriate authority.', 'c', 40);
INSERT INTO checklist_item (code, display_value, description, status, display_order) VALUES ('regInterests', 'Registered Interests', 'All interests registered on the land have been investigated and addressed.', 'c', 50);
INSERT INTO checklist_item (code, display_value, description, status, display_order) VALUES ('transferDocs', 'Transfer Documents', 'Documents to transfer land have been prepared and submitted to the Land Registration Authority', 'c', 60);
INSERT INTO checklist_item (code, display_value, description, status, display_order) VALUES ('conditions', 'Lease Conditions', 'Lease conditions have been negotiated and agreeded', 'c', 70);


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

INSERT INTO negotiate_status (code, display_value, description, status) VALUES ('pending', 'Pending', 'The offer is being prepared and has not been presented to the other party yet.', 'c');
INSERT INTO negotiate_status (code, display_value, description, status) VALUES ('negotiating', 'Negotiating', 'The parties are negotiating the price and/or conditions.', 'c');
INSERT INTO negotiate_status (code, display_value, description, status) VALUES ('rejected', 'Rejected', 'The party that received the original offer has rejected it and stopped further negotiation.', 'c');
INSERT INTO negotiate_status (code, display_value, description, status) VALUES ('withdrawn', 'Withdrawn', 'The initiating party has withdrawn their offer and stopped further negotiation.', 'c');
INSERT INTO negotiate_status (code, display_value, description, status) VALUES ('completed', 'Completed', 'The negotiation is complete and all necessary paperwork has been finalized.', 'c');
INSERT INTO negotiate_status (code, display_value, description, status) VALUES ('notified', 'Notified', 'The purchaser has notified or presented an offer to the vendor for their consideration.', 'c');


ALTER TABLE negotiate_status ENABLE TRIGGER ALL;

--
-- Data for Name: negotiate_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE negotiate_type DISABLE TRIGGER ALL;

INSERT INTO negotiate_type (code, display_value, description, status) VALUES ('compulsory', 'Compulsory', 'The parties are compelled to negotiation by statute or other legal requirement.', 'c');
INSERT INTO negotiate_type (code, display_value, description, status) VALUES ('open', 'Open Market', 'The negotiation is free and open and neither party is required to participate.', 'c');
INSERT INTO negotiate_type (code, display_value, description, status) VALUES ('lease', 'Lease', 'The negotiation in relation to leasing rather purchasing the property.', 'c');


ALTER TABLE negotiate_type ENABLE TRIGGER ALL;

--
-- Data for Name: notify_relationship_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE notify_relationship_type DISABLE TRIGGER ALL;

INSERT INTO notify_relationship_type (code, display_value, description, status) VALUES ('owner', 'Owner', 'Party to notify is an owner of land affected by the job.', 'c');
INSERT INTO notify_relationship_type (code, display_value, description, status) VALUES ('adjoiningOwner', 'Adjoining Owner', 'Party to notify is an owner of land adjoining the land affected by the job', 'c');
INSERT INTO notify_relationship_type (code, display_value, description, status) VALUES ('occupier', 'Occupier', 'Party to notify is and occupier or tenant of the land affected by the job', 'c');
INSERT INTO notify_relationship_type (code, display_value, description, status) VALUES ('adjoiningOccupier', 'Adjoining Occupier', 'Party to notify is an occupier or tenant of land adjoining the land affected by the job', 'c');
INSERT INTO notify_relationship_type (code, display_value, description, status) VALUES ('rightHolder', 'Rightholder', 'Party to notify has a recognized right or interest (e.g. easement) over the land affected by the job', 'c');
INSERT INTO notify_relationship_type (code, display_value, description, status) VALUES ('other', 'Other', 'Party to notify has a general interest in the land but is not an owner, rightholder, occuiper or tenant of the land affected by the job.', 'c');


ALTER TABLE notify_relationship_type ENABLE TRIGGER ALL;

--
-- Data for Name: objection_status; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE objection_status DISABLE TRIGGER ALL;

INSERT INTO objection_status (code, display_value, description, status) VALUES ('lodged', 'Lodged', 'The objection hs been lodged but has yet to be assessed.', 'c');
INSERT INTO objection_status (code, display_value, description, status) VALUES ('open', 'Open', 'The objection is being assessed and relevant actions to resolve the objection are in progress.', 'c');
INSERT INTO objection_status (code, display_value, description, status) VALUES ('resolved', 'Resolved', 'A suitable resolution has been reached with all parties invovled. No further actions are requried.', 'c');
INSERT INTO objection_status (code, display_value, description, status) VALUES ('closed', 'Closed', 'A resolution for the objection has been perscribed by the relavant authority.', 'c');
INSERT INTO objection_status (code, display_value, description, status) VALUES ('appeal', 'Appeal', 'The resolution proposed for the objection is being appealled by one or more parties.', 'c');
INSERT INTO objection_status (code, display_value, description, status) VALUES ('withdrawn', 'Withdrawn', 'The parties lodging the objection have withdrawn it.', 'c');


ALTER TABLE objection_status ENABLE TRIGGER ALL;

--
-- Data for Name: public_display_status; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE public_display_status DISABLE TRIGGER ALL;

INSERT INTO public_display_status (code, display_value, description, status) VALUES ('proposed', 'Proposed', 'Item is proposed for public display', 'c');
INSERT INTO public_display_status (code, display_value, description, status) VALUES ('beingPreped', 'Being Prepared', 'Item is being prepared for public display', 'c');
INSERT INTO public_display_status (code, display_value, description, status) VALUES ('ready', 'Ready', 'Item is ready for public display', 'c');
INSERT INTO public_display_status (code, display_value, description, status) VALUES ('withdrawn', 'Withdrawn', 'Item is being withdrawn from public display', 'c');


ALTER TABLE public_display_status ENABLE TRIGGER ALL;

--
-- Data for Name: public_display_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE public_display_type DISABLE TRIGGER ALL;

INSERT INTO public_display_type (code, display_value, description, status) VALUES ('displayMap', 'Display Map', 'Item for display is a Public Display Map illustrating the location of parcels affected', 'c');
INSERT INTO public_display_type (code, display_value, description, status) VALUES ('newspaper', 'Newspaper', 'Item a newspaper advert or notice', 'c');
INSERT INTO public_display_type (code, display_value, description, status) VALUES ('website', 'Website', 'The item for display is a website or website page', 'c');
INSERT INTO public_display_type (code, display_value, description, status) VALUES ('gazette', 'Gazette Notice', 'Item is a gazette notice', 'c');


ALTER TABLE public_display_type ENABLE TRIGGER ALL;

--
-- Data for Name: request_category_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE request_category_type DISABLE TRIGGER ALL;

INSERT INTO request_category_type (code, display_value, description, status) VALUES ('informationServices', 'Information Services::::Информационные услуги::::خدمات معلوماتية::::Services Information', '...::::...::::خدمات معلوماتية::::...', 'c');
INSERT INTO request_category_type (code, display_value, description, status) VALUES ('registrationServices', 'Registration Services::::Регистрационные услуги::::خدمات تسجيل::::Services Enregistrement', '...::::...::::خدمات تسجيل::::...', 'c');
INSERT INTO request_category_type (code, display_value, description, status) VALUES ('stateLandServices', 'State Land Services', 'Services used to support state land', 'c');


ALTER TABLE request_category_type ENABLE TRIGGER ALL;

--
-- Data for Name: request_display_group; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE request_display_group DISABLE TRIGGER ALL;

INSERT INTO request_display_group (code, display_value, description, status) VALUES ('parcels', 'Parcels', 'Parcels display group.', 'c');
INSERT INTO request_display_group (code, display_value, description, status) VALUES ('property', 'Property', 'Property display group.', 'c');
INSERT INTO request_display_group (code, display_value, description, status) VALUES ('job', 'Job', 'Job display group.', 'c');


ALTER TABLE request_display_group ENABLE TRIGGER ALL;

--
-- Data for Name: type_action; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE type_action DISABLE TRIGGER ALL;

INSERT INTO type_action (code, display_value, description, status) VALUES ('new', 'New::::Новый::::جديد::::Nouveau', '...::::...::::...::::...', 'c');
INSERT INTO type_action (code, display_value, description, status) VALUES ('cancel', 'Cancel::::Отмена::::الغاء::::Annuler', '...::::...::::...::::...', 'c');
INSERT INTO type_action (code, display_value, description, status) VALUES ('vary', 'Vary::::Изменить::::تعديل::::Varier', '...::::...::::...::::...', 'c');


ALTER TABLE type_action ENABLE TRIGGER ALL;

--
-- Data for Name: request_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE request_type DISABLE TRIGGER ALL;

INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('cadastreExport', 'informationServices', 'Cadastre Export::::Экспорт кадастра еще текст::::تصدير المساحة::::Exporter Cadastre', '...::::::::...::::...', 'x', 1, 0.00, 0.10, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('cadastreBulk', 'informationServices', 'Cadastre Bulk Export::::Массовая загрузка кадастровых данных::::تصدير  رزمة مساحة::::Export Cadastre Groupé', '...::::...::::...::::...', 'x', 5, 5.00, 0.10, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('regnPowerOfAttorney', 'registrationServices', 'Registration of Power of Attorney::::Регистрация доверенности::::تسجيل وكالة::::Enregistrement de la Procuration', '...::::...::::...::::...', 'x', 3, 5.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'documentTrans', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('regnStandardDocument', 'registrationServices', 'Registration of Standard Document::::Регистрация типового документа::::تسجيل وثيقة مرجعية::::Enregistrement du Document Standard', '...::::...::::...::::...', 'x', 3, 5.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'documentTrans', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('cnclStandardDocument', 'registrationServices', 'Withdraw Standard Document::::Удалить типовой документ::::سحب الوثيقة المرجعية::::Retirer Document Standard', 'To withdraw from use any standard document (such as standard mortgage or standard lease)::::...::::...::::...', 'x', 1, 5.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'documentTrans', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('cnclPowerOfAttorney', 'registrationServices', 'Cancel Power of Attorney::::Нотариальная доверенность::::الغاء التوكيل::::Annuller Procuration', '...::::...::::...::::...', 'x', 1, 5.00, 0.00, 0.00, 0, NULL, NULL, 'cancel', 'documentTrans', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('surveyPlanCopy', 'informationServices', 'Survey Plan Copy::::Копия кадастрового плана::::نسخة خطة مساحة::::Copie Plan de Levé', '...::::...::::...::::...', 'x', 1, 1.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'documentSearch', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('documentCopy', 'informationServices', 'Document Copy::::Копия документа::::نسخ وثيقة::::Copie Document', '...::::...::::...::::...', 'x', 1, 0.50, 0.00, 0.00, 0, NULL, NULL, NULL, 'documentSearch', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('cadastrePrint', 'informationServices', 'Cadastre Print::::Печать кадастровых данных::::اطبع المساحة::::Imprimer Cadastre', '...::::...::::...::::...', 'x', 1, 0.50, 0.00, 0.00, 0, NULL, NULL, NULL, 'map', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('serviceEnquiry', 'informationServices', 'Service Enquiry::::Запрос информации о заявлении::::طلب معلومات::::Service Enquête', '...::::...::::...::::...', 'x', 1, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'applicationSearch', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('cadastreChange', 'registrationServices', 'Change to Cadastre::::Изменение кадастра::::تغيير المساحة::::Modification du Cadastre', '...::::...::::...::::...', 'x', 30, 25.00, 0.10, 0.00, 1, NULL, NULL, NULL, 'cadastreTransMap', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('redefineCadastre', 'registrationServices', 'Redefine Cadastre::::Изменение кадастрового объекта::::تعديل المساحة::::Redéfinir Cadastre', '...::::...::::...::::...', 'x', 30, 25.00, 0.10, 0.00, 1, NULL, NULL, NULL, 'cadastreTransMap', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('mapExistingParcel', 'registrationServices', 'Map Existing Parcel', '', 'x', 30, 0.00, 0.00, 0.00, 0, 'Allows to make changes to the cadastre', NULL, NULL, 'cadastreTransMap', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('titleSearch', 'informationServices', 'Title Search::::Поиск недвижимости::::البحث عن سند ملكية.::::Recherche Titre', '...::::...::::...::::...', 'x', 1, 5.00, 0.00, 0.00, 1, NULL, NULL, NULL, 'propertySearch', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('lodgeObjection', 'registrationServices', 'Lodge Objection::::Заявление оспаривания права::::اعتراض::::Objection Dépôt', '...::::...::::...::::...', 'x', 90, 5.00, 0.00, 0.00, 1, NULL, NULL, NULL, 'newProperty', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('newState', 'registrationServices', 'New State Title::::Новое право собственности (государственное)::::سند ملكية عقار جديد::::Nouveau Titre d''Etat', '...::::...::::...::::...', 'x', 5, 0.00, 0.00, 0.00, 1, 'State Estate', NULL, NULL, 'newProperty', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('newFreehold', 'registrationServices', 'New Freehold Title::::Новое право собственности (свободное)::::سند ملكية جديد::::Nouveau Titre Propriété', '...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, 'Fee Simple Estate', NULL, NULL, 'newProperty', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('newApartment', 'registrationServices', 'New Apartment Title::::Новое право на квартиру::::سند ملكية . لشقة جديدة::::Titre Nouvel Appartement', '...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.02, 1, 'Apartment Estate', 'apartment', 'new', 'newProperty', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('systematicRegn', 'registrationServices', 'Systematic Registration Claim::::Запрос на системную регистрацию::::المطالبة بتسجيل منتظم::::Déclaration Enregistrement Systèmatique', '...::::...::::...::::...', 'x', 90, 50.00, 0.00, 0.00, 0, 'Title issued at completion of systematic registration', 'ownership', 'new', 'newProperty', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('recordTransfer', 'informationServices', 'Record transfer::::Record transfer in russian::::Record transfer in arabic::::Record transfer in french', '...::::...::::...::::...', 'x', 1, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('varyCaveat', 'registrationServices', 'Vary caveat::::Изменить арест::::تعديل القيد::::Varier Caveat', '...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, '<Caveat> <reference>', 'caveat', 'vary', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('regnOnTitle', 'registrationServices', 'Registration on Title::::Регистрация права собственности::::...::::Enregistrement du Titre', '...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.01, 1, NULL, NULL, NULL, 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('varyMortgage', 'registrationServices', 'Vary Mortgage::::Изменить ипотеку::::تعديل الرهن.::::Varier Hypothèque', '...::::...::::...::::...', 'x', 1, 5.00, 0.00, 0.00, 1, 'Change on the mortgage', 'mortgage', 'vary', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('varyRight', 'registrationServices', 'Vary Right (General)::::Изменить право (общее)::::تعديل حق (عام)::::Varier Droit (Général)', '...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, 'Variation of <right> <reference>', NULL, 'vary', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('removeCaveat', 'registrationServices', 'Remove Caveat::::Снять ограничение::::...::::Supprimer Caveat', '...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, 'Caveat <reference> removed', 'caveat', 'cancel', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('caveat', 'registrationServices', 'Register Caveat::::Регистрация ареста::::تسجيل  قيد::::Enregistrer Caveat', '...::::...::::...::::...', 'x', 5, 50.00, 0.00, 0.00, 1, 'Caveat in the name of <name>', 'caveat', 'new', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('newOwnership', 'registrationServices', 'Change of Ownership::::Смена владельца::::تغيير الملكية::::Changement de propriétaire', '...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.02, 1, 'Transfer to <name>', 'ownership', 'vary', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('noteOccupation', 'registrationServices', 'Occupation Noted::::Уведомление о самозахвате::::ملاحظة استخدام::::Mention Occupation', '...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.01, 1, 'Occupation by <name> recorded', NULL, NULL, 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('cancelProperty', 'registrationServices', 'Cancel title::::Прекращение права собственности::::الغاء سند ملكية::::Annuler Titre', '...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, '', NULL, 'cancel', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('newDigitalTitle', 'registrationServices', 'Convert to Digital Title::::Новое право собственности (конвертация)::::تحويل الى سند ملكية الكتروني::::Convertir en Titre Numérique', '...::::...::::...::::...', 'x', 5, 0.00, 0.00, 0.00, 1, 'Title converted to digital format', NULL, NULL, 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('regnDeeds', 'registrationServices', 'Deed Registration::::Регистрация сделки::::تسجيل حركة::::Enregistrement Acte', '...::::...::::...::::...', 'x', 3, 1.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('registerLease', 'registrationServices', 'Register Lease::::Регистрация права пользования::::تسجيل ايجار::::Enregistrer Bail', '...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.01, 1, 'Lease of nn years to <name>', 'lease', 'new', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('mortgage', 'registrationServices', 'Register Mortgage::::Регистрация ипотеки::::تسجيل رهن::::Enregistrer Hypothèque', '...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, 'Mortgage to <lender>', 'mortgage', 'new', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('servitude', 'registrationServices', 'Register Servitude::::Регистрация сервитута::::حق استخدام الطريق::::Enregistrer Servitude', '...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, 'Servitude over <parcel1> in favour of <parcel2>', 'servitude', 'new', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('limitedRoadAccess', 'registrationServices', 'Register Limited Road Access::::Регистрация ограниченного доступа к дороги::::تسجيل  دخول طريق محدودة::::Enregistrer Route Accès Limité', '...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, 'Limited Road Access', 'limitedAccess', NULL, 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('waterRights', 'registrationServices', 'Register Water Rights::::Регистрация права пользования водными ресурсами::::تسجيل حق الانتفاع (مياه).::::Enregistrer Droits d''Eau', '...::::...::::...::::...', 'x', 5, 5.00, 0.01, 0.00, 1, 'Water Rights granted to <name>', 'waterrights', 'new', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('lifeEstate', 'registrationServices', 'Establish Life Estate::::Регистрация пожизненного права пользования::::انشاء تمليك عقار مدى الحياة.::::Constitution Donation au dernier vivant / Viager', '...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.02, 1, 'Life Estate for <name1> with Remainder Estate in <name2, name3>', 'lifeEstate', 'new', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('historicOrder', 'registrationServices', 'Register Historic Preservation Order::::Регистрация недвижимости исторического назначения::::تسجيل امر حفظ تاريخي::::Enregistrer Ordonnance de Préservation Historique', '...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, 'Historic Preservation Order', 'noBuilding', 'new', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('usufruct', 'registrationServices', 'Register Usufruct::::Регистрация права пользования ресурсами::::حق الانتفاع::::Enregistrer Usufruit', '...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, '<usufruct> right granted to <name>', 'usufruct', 'new', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('buildingRestriction', 'registrationServices', 'Register Building Restriction::::Регистрация ограничения на строение::::تسجيل قيود بناية::::Enregistrer Restriction de Bâtiment', '...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, 'Building Restriction', 'noBuilding', 'new', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('removeRight', 'registrationServices', 'Remove Right (General)::::Прекратить право::::الغاء حق (عام)::::Supprimer Droit (Général)', '...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, '<right> <reference> cancelled', NULL, 'cancel', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('varyLease', 'registrationServices', 'Vary Lease::::Изменить право пользования::::تعديل الايجار::::Varier Bail', '...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, 'Variation of Lease <reference>', 'lease', 'vary', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('removeRestriction', 'registrationServices', 'Remove Restriction (General)::::Снять ограничение::::ازالة قيد::::Supprimer Restriction (Général)', '...::::...::::...::::...', 'x', 5, 5.00, 0.00, 0.00, 1, '<restriction> <reference> cancelled', NULL, 'cancel', 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('newDigitalProperty', 'registrationServices', 'New Digital Property::::Регистрация существующего права собственности::::أنشاء سند الكتروني جديد::::Nouvelle Propriété Numérique', '...::::...::::...::::...', 'x', 5, 0.00, 0.00, 0.00, 1, NULL, NULL, NULL, 'property', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('changeSLParcels', 'stateLandServices', 'Create or Change Parcels', 'Create, change or dispose State Land Parcels', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'cadastreTransMap', 'parcels', 10);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('recordStateLand', 'stateLandServices', 'Record New Property', 'Create a new State Land Property', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'newSLProperty', 'property', 20);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('maintainStateLand', 'stateLandServices', 'Maintain Property', 'Add or change details for an existing State Land Property including interests, parcels and relationships', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'slProperty', 'property', 30);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('slValuation', 'stateLandServices', 'Manage Valuations', 'Records details of valuations raised by parties affected by State Land activities', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'slValuation', 'property', 40);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('cancelInterest', 'stateLandServices', 'Cancel Interest', 'Cancel one or more interests on an existing State Land Property', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, 'cancel', 'slProperty', 'property', 50);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('disposeSLProperty', 'stateLandServices', 'Dispose Property', 'Updates a State Land Property to indicate the state has disposed of it', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, 'cancel', 'slProperty', 'property', 60);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('checklist', 'stateLandServices', 'Checklist', 'Identifies a checklist of items to be completed for this Job', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'checklist', 'job', 70);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('publicDisplayMap', 'stateLandServices', 'Public Display Map', 'Generates a map of the job area for public display purposes', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'publicDisplayMap', 'job', 80);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('publicDisplay', 'stateLandServices', 'Mangage Public Display', 'Can be used to plan and track public display items', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'publicDisplay', 'job', 90);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('slNotify', 'stateLandServices', 'Manage Notifications', 'Used for generating and managing bulk notifications related to the job', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'slNotify', 'job', 100);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('slNegotiate', 'stateLandServices', 'Manage Negotiations', 'Used for managing negotiations for property acquisition or disposal', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'slNegotiate', 'job', 110);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('slObjection', 'stateLandServices', 'Manage Objections', 'Records details of objections raised by parties affected by State Land activities', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'slObjection', 'job', 120);


ALTER TABLE request_type ENABLE TRIGGER ALL;

--
-- Data for Name: service_status_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE service_status_type DISABLE TRIGGER ALL;

INSERT INTO service_status_type (code, display_value, status, description) VALUES ('cancelled', 'Cancelled::::Отменен::::ملغاة::::Annulé', 'c', '...::::...::::...::::...');
INSERT INTO service_status_type (code, display_value, status, description) VALUES ('pending', 'Pending::::На исполнении::::قيد الانتظار::::En attente', 'c', '...::::...::::...::::');
INSERT INTO service_status_type (code, display_value, status, description) VALUES ('completed', 'Completed::::Завершен::::مكتملة.::::Exécuté', 'c', '...::::...::::...::::...');
INSERT INTO service_status_type (code, display_value, status, description) VALUES ('lodged', 'Lodged::::Зарегистрирован::::مودعة::::Enregistré', 'c', 'Application for a service has been lodged and officially received by land office::::Заявление было подано и зарегистрировано в регистрационном офисе::::...::::Demande de service a été déposée et officiellement reçue par l''Officier d''Etat');


ALTER TABLE service_status_type ENABLE TRIGGER ALL;

--
-- Data for Name: service_action_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE service_action_type DISABLE TRIGGER ALL;

INSERT INTO service_action_type (code, display_value, status_to_set, status, description) VALUES ('lodge', 'Lodge::::Подать заявление::::ايداع::::Déposer', 'lodged', 'c', 'Application for service(s) is officially received by land office (action is automatically logged when application is saved for the first time)::::Заявление принято официально регистрационным офисом (событие будет автоматически записано в журнал событий)::::.استلام الطلب رسميا من قبل دائرة الاراضي  حيث يتم حفظه بحالة مودع::::Demande de service(s) officiellement reçue par l''Officier d''Etat (action déposée automatiquement quand la demande est sauvegardée pour la première fois)');
INSERT INTO service_action_type (code, display_value, status_to_set, status, description) VALUES ('revert', 'Revert::::Вернуть на доработку::::تراجع::::Retourner', 'pending', 'c', 'The status of the service has been reverted to pending from being completed (action is automatically logged when a service is reverted back for further work)::::Статус услуги изменен к "исполняется" (событие будет автоматически записано в журнал событий)::::يتم تغيير حالة الخدمة الى  قيد الانتظار عندما تحتاج الخدمة الى مزيد من المعلومات او العمل::::Le statut du service a été retourné du statut "complet" au statut "en attente" (action déposée automatiquement quand un service est retourné pour plus de travail)');
INSERT INTO service_action_type (code, display_value, status_to_set, status, description) VALUES ('cancel', 'Cancel::::Отмена::::الغاء::::Annuler', 'cancelled', 'c', 'Service is cancelled by Land Office (action is automatically logged when a service is cancelled)::::Отмена услуги регистрационным офисом (отмена будет автоматически зафиксирована в журнале событий)::::تم الغاء الخدمة من قبل دائرة الاراضي . الخدمات الملغاة يتم تسجيلها تلقائيا من قبل النظام::::Service annulé par l''Officier d''Etat (action déposée automatiquement quand un service est annulé)');
INSERT INTO service_action_type (code, display_value, status_to_set, status, description) VALUES ('start', 'Start::::Запустить::::ابدأ::::Commencer', 'pending', 'c', 'Provisional RRR Changes Made to Database as a result of application (action is automatically logged when a change is made to a rrr object)::::Определенные изменения должны быть сделаны, относящиеся к услуги (событие будет автоматически записано в журнал событий)::::يتم تسجيل الحالة عندما يحدث تغيير على الكائن::::Changement des RRR provisionnels réalisé dans la base de données suite au résultat de la demande (action déposée automatiquement quand un changement est fait sur un objet RRR)');
INSERT INTO service_action_type (code, display_value, status_to_set, status, description) VALUES ('complete', 'Complete::::Завершить::::انهاء::::...', 'completed', 'c', 'Application is ready for approval (action is automatically logged when service is marked as complete::::Заявление готово к одобрению (событие будет автоматически записано в журнал событий)::::الطلب جاهز للموافقة عندما تتغير حالة الخدمة الى مكتملة::::Demande prête pour approbation (action déposée automatiquement quand le service est marqué comme complet)');


ALTER TABLE service_action_type ENABLE TRIGGER ALL;

SET search_path = cadastre, pg_catalog;

--
-- Data for Name: area_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE area_type DISABLE TRIGGER ALL;

INSERT INTO area_type (code, display_value, description, status) VALUES ('calculatedArea', 'Calculated Area::::Вычисленная Площадь::::المساحة المحسوبة::::Superficie Calculée', '', 'c');
INSERT INTO area_type (code, display_value, description, status) VALUES ('nonOfficialArea', 'Non-official Area::::Неофициальная Площадь::::Non-official Area::::Superficie Non-officielle', '', 'c');
INSERT INTO area_type (code, display_value, description, status) VALUES ('officialArea', 'Official Area::::Официальная Площадь::::المساحة الرسمية::::Superficie Officielle', '', 'c');
INSERT INTO area_type (code, display_value, description, status) VALUES ('surveyedArea', 'Surveyed Area::::Площадь по Съемке::::المساحة الممسوحة::::Superficie Levée', '', 'c');


ALTER TABLE area_type ENABLE TRIGGER ALL;

--
-- Data for Name: building_unit_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE building_unit_type DISABLE TRIGGER ALL;

INSERT INTO building_unit_type (code, display_value, description, status) VALUES ('individual', 'Individual::::Индивидуальное::::فردي::::Individuel', '', 'c');
INSERT INTO building_unit_type (code, display_value, description, status) VALUES ('shared', 'Shared::::Общая::::مشتركة::::Partagé', '', 'c');


ALTER TABLE building_unit_type ENABLE TRIGGER ALL;

--
-- Data for Name: cadastre_object_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE cadastre_object_type DISABLE TRIGGER ALL;

INSERT INTO cadastre_object_type (code, display_value, description, status, in_topology) VALUES ('parcel', 'Parcel::::Участок::::قطعة::::Parcelle', '', 'c', true);
INSERT INTO cadastre_object_type (code, display_value, description, status, in_topology) VALUES ('buildingUnit', 'Building Unit::::Единица Здания::::وحدة بناية::::Bâtiment', '', 'x', false);
INSERT INTO cadastre_object_type (code, display_value, description, status, in_topology) VALUES ('utilityNetwork', 'Utility Network::::Инфраструктурная Сеть::::شبكة خدمات::::Réseaux de services publics', '', 'x', false);
INSERT INTO cadastre_object_type (code, display_value, description, status, in_topology) VALUES ('stateLand', 'State Land Parcel', NULL, 'c', false);


ALTER TABLE cadastre_object_type ENABLE TRIGGER ALL;

--
-- Data for Name: dimension_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE dimension_type DISABLE TRIGGER ALL;

INSERT INTO dimension_type (code, display_value, description, status) VALUES ('0D', '0D::::0D::::0D::::0D', '', 'c');
INSERT INTO dimension_type (code, display_value, description, status) VALUES ('1D', '1D::::1D::::1D::::1D', '', 'c');
INSERT INTO dimension_type (code, display_value, description, status) VALUES ('2D', '2D::::2D::::2D::::2D', '', 'c');
INSERT INTO dimension_type (code, display_value, description, status) VALUES ('3D', '3D::::3D::::3D::::3D', '', 'c');
INSERT INTO dimension_type (code, display_value, description, status) VALUES ('liminal', 'Liminal::::Liminal::::Liminal::::Liminal', '', 'x');


ALTER TABLE dimension_type ENABLE TRIGGER ALL;

--
-- Data for Name: hierarchy_level; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE hierarchy_level DISABLE TRIGGER ALL;

INSERT INTO hierarchy_level (code, display_value, description, status) VALUES ('0', 'Hierarchy 0::::Hierarchy 0::::تسلسل هرمي 0::::Hiérarchie 0', '', 'c');
INSERT INTO hierarchy_level (code, display_value, description, status) VALUES ('1', 'Hierarchy 1::::Hierarchy 1::::تسلسل هرمي 1::::Hiérarchie 1', '', 'c');
INSERT INTO hierarchy_level (code, display_value, description, status) VALUES ('2', 'Hierarchy 2::::Hierarchy 2::::تسلسل هرمي 2::::Hiérarchie 2', '', 'c');
INSERT INTO hierarchy_level (code, display_value, description, status) VALUES ('3', 'Hierarchy 3::::Hierarchy 3::::تسلسل هرمي 3::::Hiérarchie 3', '', 'c');
INSERT INTO hierarchy_level (code, display_value, description, status) VALUES ('4', 'Hierarchy 4::::Hierarchy 4::::تسلسل هرمي 4::::Hiérarchie 4', '', 'c');


ALTER TABLE hierarchy_level ENABLE TRIGGER ALL;

--
-- Data for Name: land_use_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE land_use_type DISABLE TRIGGER ALL;

INSERT INTO land_use_type (code, display_value, description, status) VALUES ('commercial', 'Commercial::::Коммерческая::::تجاري::::Commercial', '', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('residential', 'Residential::::Жилая::::سكني::::Résidentiel', '', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('industrial', 'Industrial::::Производственная::::صناعي::::Industriel', '', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('agricultural', 'Agricultural::::Сельскохозяйственная::::زراعي::::Agricole', '', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('road', 'Road', 'The land is used for roading.', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('riverBed', 'River bed', 'The land is part of a river bed.', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('park', 'Park or Playground', 'The land is used for a local park, playground or local reserve.', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('regionalPark', 'Regional Park', 'The land is used for a regional park.', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('nationalPark', 'National Park', 'The land is used for a national park.', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('seabed', 'Seabed', 'The land is seabed.', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('greenZone', 'Green Zone', 'The land is designated as a green zone between developed and less developed or undeveloped areas.', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('accessway', 'Accessway', 'The land is used for public access', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('building', 'Building', 'The land is used for a public or commerical building', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('mining', 'Mining', 'The land is used for a mine', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('marineReserve', 'Marine Reserve', 'The land is used for a marine reserve', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('hospital', 'Hospital', 'The land is part of a hospital', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('forestry', 'Forestry', 'The land is part of a forest', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('pastoral', 'Pastoral', 'The land is pastoral land', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('utility', 'Utility', 'The land is used for a utility such as a power substation, dam, water treatment plant, etc.', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('educational', 'Educational', 'The land is used for an educational facility such as a school, university or training institution.', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('military', 'Military', 'The land is used for a militry base or other military installation.', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('transport', 'Transportation', 'The land is used as a transportation hub such as a bus stop, railway station or ferry terminal.', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('wharf', 'Wharf, Ramp or Jetty', 'The land has a wharf, boat ramp or jetty erected on it.', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('marginalStrip', 'Marginal Strip', 'The land extending along the landward margins of the foreshore and other water bodies.', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('foreshore', 'Foreshore', 'The foreshore of water bodies such as seas, lakes and rivers.', 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('cemetery', 'Cemetery', 'The land is used for a cemetery or burial ground.', 'c');


ALTER TABLE land_use_type ENABLE TRIGGER ALL;

--
-- Data for Name: level_content_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE level_content_type DISABLE TRIGGER ALL;

INSERT INTO level_content_type (code, display_value, description, status) VALUES ('building', 'Building::::Здание::::بناية::::Bâtiment', '', 'x');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('customary', 'Customary::::Традиционный::::عرفي::::Coutumier', '', 'x');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('informal', 'Informal::::Неформальный::::غير رسمي::::Informel', '', 'x');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('mixed', 'Mixed::::Смешанный::::مختلط::::Mixte', '', 'x');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('network', 'Network::::Сеть::::شبكة::::Réseau', '', 'x');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('primaryRight', 'Primary Right::::Первичное право::::حق اساسي::::Droit Principal', '', 'c');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('responsibility', 'Responsibility::::Ответственность::::المسؤوليات::::Responsibilité', '', 'x');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('restriction', 'Restriction::::Ограничение::::القيود::::Restriction', '', 'c');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('geographicLocator', 'Geographic Locators::::Географические Точки::::تحديد المواقع الجغرافية::::Repères Géographiques', 'Extension to LADM::::Расширение LADM::::Extension to LADM::::Extension au LADM', 'c');


ALTER TABLE level_content_type ENABLE TRIGGER ALL;

--
-- Data for Name: register_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE register_type DISABLE TRIGGER ALL;

INSERT INTO register_type (code, display_value, description, status) VALUES ('all', 'All::::Все::::الجميع::::Tout', '', 'c');
INSERT INTO register_type (code, display_value, description, status) VALUES ('forest', 'Forest::::Лес::::غابات::::Forêt', '', 'c');
INSERT INTO register_type (code, display_value, description, status) VALUES ('mining', 'Mining::::Добыча::::التعدين::::Mine', '', 'c');
INSERT INTO register_type (code, display_value, description, status) VALUES ('publicSpace', 'Public Space::::Общественная территория::::اماكن عامة::::Espace Publique', '', 'c');
INSERT INTO register_type (code, display_value, description, status) VALUES ('rural', 'Rural::::Сельский::::ريفي::::Rural', '', 'c');
INSERT INTO register_type (code, display_value, description, status) VALUES ('urban', 'Urban::::Городской::::حضري::::Urbain', '', 'c');


ALTER TABLE register_type ENABLE TRIGGER ALL;

--
-- Data for Name: state_land_status_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE state_land_status_type DISABLE TRIGGER ALL;

INSERT INTO state_land_status_type (code, display_value, description, status) VALUES ('proposed', 'Proposed', 'The land has been nominated for aquisition by the state.', 'c');
INSERT INTO state_land_status_type (code, display_value, description, status) VALUES ('current', 'Current', 'The state is currently responsible for managing or maintaining the land', 'c');
INSERT INTO state_land_status_type (code, display_value, description, status) VALUES ('dormant', 'Dormant', 'The land is not being used for any purpose (e.g. it has been land banked)', 'c');
INSERT INTO state_land_status_type (code, display_value, description, status) VALUES ('surplus', 'Surplus', 'The land is no longer required by the state and can be disposed of.', 'c');
INSERT INTO state_land_status_type (code, display_value, description, status) VALUES ('disposed', 'Disposed', 'The land has been disposed of and is no longer the responsiblity of the state.', 'c');


ALTER TABLE state_land_status_type ENABLE TRIGGER ALL;

--
-- Data for Name: structure_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE structure_type DISABLE TRIGGER ALL;

INSERT INTO structure_type (code, display_value, description, status) VALUES ('point', 'Point::::Точка::::Point::::Point', '', 'c');
INSERT INTO structure_type (code, display_value, description, status) VALUES ('polygon', 'Polygon::::Полигон::::مضلع::::Polygone', '', 'c');
INSERT INTO structure_type (code, display_value, description, status) VALUES ('sketch', 'Sketch::::Схема::::رسم تخطيطي::::Croquis', '', 'c');
INSERT INTO structure_type (code, display_value, description, status) VALUES ('text', 'Text::::Текс::::نص::::Texte', '', 'c');
INSERT INTO structure_type (code, display_value, description, status) VALUES ('topological', 'Topological::::Топологический::::طبوغرافي::::Topologique', '', 'c');
INSERT INTO structure_type (code, display_value, description, status) VALUES ('unStructuredLine', 'UnstructuredLine::::Неструктурированная линия::::خط غير منتظم::::Ligne', '', 'c');


ALTER TABLE structure_type ENABLE TRIGGER ALL;

--
-- Data for Name: surface_relation_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE surface_relation_type DISABLE TRIGGER ALL;

INSERT INTO surface_relation_type (code, display_value, description, status) VALUES ('above', 'Above::::Над::::فوق::::Au-dessus', '', 'x');
INSERT INTO surface_relation_type (code, display_value, description, status) VALUES ('below', 'Below::::Под::::أسفل::::En-dessous', '', 'x');
INSERT INTO surface_relation_type (code, display_value, description, status) VALUES ('mixed', 'Mixed::::Смешанный::::مختلط::::Mixte', '', 'x');
INSERT INTO surface_relation_type (code, display_value, description, status) VALUES ('onSurface', 'On Surface::::На Поверхности::::فوق السطح::::En Surface', '', 'c');


ALTER TABLE surface_relation_type ENABLE TRIGGER ALL;

--
-- Data for Name: utility_network_status_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE utility_network_status_type DISABLE TRIGGER ALL;

INSERT INTO utility_network_status_type (code, display_value, description, status) VALUES ('inUse', 'In Use::::Используется::::قيد الاستخدام::::Utilisé', '', 'c');
INSERT INTO utility_network_status_type (code, display_value, description, status) VALUES ('outOfUse', 'Out of Use::::Не используется::::خارج الخدمة::::Hors d''usage', '', 'c');
INSERT INTO utility_network_status_type (code, display_value, description, status) VALUES ('planned', 'Planned::::Запланировано::::مخطط::::Planifié', '', 'c');


ALTER TABLE utility_network_status_type ENABLE TRIGGER ALL;

--
-- Data for Name: utility_network_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE utility_network_type DISABLE TRIGGER ALL;

INSERT INTO utility_network_type (code, display_value, description, status) VALUES ('chemical', 'Chemicals::::Химическая::::كيمياء::::Produits chimiques', '', 'c');
INSERT INTO utility_network_type (code, display_value, description, status) VALUES ('electricity', 'Electricity::::Электричество::::كهرباء::::Electricité', '', 'c');
INSERT INTO utility_network_type (code, display_value, description, status) VALUES ('gas', 'Gas::::Газ::::غاز::::Gaz', '', 'c');
INSERT INTO utility_network_type (code, display_value, description, status) VALUES ('heating', 'Heating::::Отопление::::حرارة::::Chauffage', '', 'c');
INSERT INTO utility_network_type (code, display_value, description, status) VALUES ('oil', 'Oil::::Нефть::::بترول::::Pétrol', '', 'c');
INSERT INTO utility_network_type (code, display_value, description, status) VALUES ('telecommunication', 'Telecommunication::::Телекоммуникации::::اتصالات::::Télécommunication', '', 'c');
INSERT INTO utility_network_type (code, display_value, description, status) VALUES ('water', 'Water::::Вода::::ماء::::Eau', '', 'c');


ALTER TABLE utility_network_type ENABLE TRIGGER ALL;

SET search_path = opentenure, pg_catalog;

--
-- Data for Name: claim_status; Type: TABLE DATA; Schema: opentenure; Owner: postgres
--

ALTER TABLE claim_status DISABLE TRIGGER ALL;

INSERT INTO claim_status (code, display_value, status, description) VALUES ('unmoderated', 'Un-moderated', 'i', '');
INSERT INTO claim_status (code, display_value, status, description) VALUES ('challenged', 'Challenged', 'i', '');
INSERT INTO claim_status (code, display_value, status, description) VALUES ('moderated', 'Moderated', 'i', '');


ALTER TABLE claim_status ENABLE TRIGGER ALL;

SET search_path = party, pg_catalog;

--
-- Data for Name: communication_type; Type: TABLE DATA; Schema: party; Owner: postgres
--

ALTER TABLE communication_type DISABLE TRIGGER ALL;

INSERT INTO communication_type (code, display_value, status, description) VALUES ('courier', 'Courier::::Курьер::::ساعي بريد::::Coursier', 'c', '...::::::::...::::...');
INSERT INTO communication_type (code, display_value, status, description) VALUES ('fax', 'Fax::::Факс::::فاكس::::Fax', 'c', '...::::::::...::::...');
INSERT INTO communication_type (code, display_value, status, description) VALUES ('phone', 'Phone::::Телефон::::تلفون::::Téléphone', 'c', '...::::::::...::::...');
INSERT INTO communication_type (code, display_value, status, description) VALUES ('post', 'Post::::Почта::::بريد::::Poste', 'c', '...::::::::...::::...');
INSERT INTO communication_type (code, display_value, status, description) VALUES ('eMail', 'e-Mail::::Эл. почта::::بريد الكتروني::::Courriel', 'c', '...::::::::...::::...');


ALTER TABLE communication_type ENABLE TRIGGER ALL;

--
-- Data for Name: gender_type; Type: TABLE DATA; Schema: party; Owner: postgres
--

ALTER TABLE gender_type DISABLE TRIGGER ALL;

INSERT INTO gender_type (code, display_value, status, description) VALUES ('female', 'Female::::Женский::::أنثى::::Femme', 'c', '...::::::::...::::...');
INSERT INTO gender_type (code, display_value, status, description) VALUES ('male', 'Male::::Мужской::::ذكر::::Homme', 'c', '...::::::::...::::...');
INSERT INTO gender_type (code, display_value, status, description) VALUES ('na', 'Not applicable', 'c', NULL);


ALTER TABLE gender_type ENABLE TRIGGER ALL;

--
-- Data for Name: group_party_type; Type: TABLE DATA; Schema: party; Owner: postgres
--

ALTER TABLE group_party_type DISABLE TRIGGER ALL;

INSERT INTO group_party_type (code, display_value, status, description) VALUES ('tribe', 'Tribe::::Племя::::القبيلة::::Tribu', 'x', '');
INSERT INTO group_party_type (code, display_value, status, description) VALUES ('association', 'Association::::Ассоциация::::رابطة::::Association', 'c', '');
INSERT INTO group_party_type (code, display_value, status, description) VALUES ('family', 'Family::::Семья::::العائلة::::Famille', 'c', '');
INSERT INTO group_party_type (code, display_value, status, description) VALUES ('baunitGroup', 'Basic Administrative Unit Group::::Базовая Административная Группа Единиц::::مجموعة الوحدات الادارية الاساسية::::Groupe d''Unité Administrative de Base', 'x', '');


ALTER TABLE group_party_type ENABLE TRIGGER ALL;

--
-- Data for Name: id_type; Type: TABLE DATA; Schema: party; Owner: postgres
--

ALTER TABLE id_type DISABLE TRIGGER ALL;

INSERT INTO id_type (code, display_value, status, description) VALUES ('nationalID', 'National ID::::Внутренний ID::::بطاقة شخصية::::Carte Nationale d''Identité', 'c', 'The main person ID that exists in the country::::Внутренняя ID карта гражданина внутри страны::::...::::Le document principal d''identité existant dans le pays');
INSERT INTO id_type (code, display_value, status, description) VALUES ('nationalPassport', 'National Passport::::Паспорт::::جواز سفر::::Passeport National', 'c', 'A passport issued by the country::::Паспорт, выданный в стране::::...::::Un passeport délivré par le pays');
INSERT INTO id_type (code, display_value, status, description) VALUES ('otherPassport', 'Other Passport::::Другой паспорт::::جواز سفراخر::::Autre passeport', 'c', 'A passport issued by another country::::Паспорт выданный другой страной::::...::::Un passeport délivré par un autre pays');


ALTER TABLE id_type ENABLE TRIGGER ALL;

--
-- Data for Name: party_role_type; Type: TABLE DATA; Schema: party; Owner: postgres
--

ALTER TABLE party_role_type DISABLE TRIGGER ALL;

INSERT INTO party_role_type (code, display_value, status, description) VALUES ('bank', 'Bank::::Банк::::البنك::::Banque', 'c', '...::::::::...::::...');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('transferor', 'Transferor (from)::::Цедент::::منقول منه::::Cédant (de)', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('citizen', 'Citizen::::Гражданин::::المواطن::::Citoyen', 'c', '...::::::::...::::...');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('writer', 'Writer::::Оформитель документов::::كاتب::::Auteur', 'x', '...::::::::...::::...');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('conveyor', 'Conveyor::::Перевозчик::::الموصل::::Convoyeur', 'x', '...::::::::...::::...');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('employee', 'Employee::::Служащий::::الموظف::::Employé', 'x', '...::::::::...::::...');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('farmer', 'Farmer::::Фермер::::مزارع::::Agriculteur', 'x', '...::::::::...::::...');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('landOfficer', 'Land Officer::::Землеустроитель::::موظف دائرة الاراضي::::Officier d''Etat / du Cadastre', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('certifiedSurveyor', 'Licenced Surveyor::::Лицензированный Геодезист::::مساح مرخص::::Géomètre Expert / Arpenteur licencié', 'c', '...::::::::...::::...');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('lodgingAgent', 'Lodging Agent::::Агент по подачи заявлений::::وكيل تسجيل::::Agent des Dépôts', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('moneyProvider', 'Money Provider::::Заемщик денег::::ممول::::Fournisseur d''Argent', 'c', '...::::::::...::::...');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('notary', 'Notary::::Нотариус::::كاتب عدل::::Notaire', 'c', '...::::::::...::::...');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('powerOfAttorney', 'Power of Attorney::::Адвокат (поверенный)::::وكيل::::Procuration', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('stateAdministrator', 'Registrar / Approving Surveyor::::Регистратор / Утверждающий Геодезист::::مساح معتمد::::Officier d''Etat / Géomètre Approbateur', 'c', '...::::::::...::::...');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('surveyor', 'Surveyor::::Геодезист::::مساح::::Géomètre', 'x', '...::::::::...::::...');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('transferee', 'Transferee (to)::::Получатель::::منقول له::::Cessionnaire (à)', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('applicant', 'Applicant::::Заявитель::::مقدم الطلب::::Demandeur', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('propManager', 'Property Manager', 'c', 'Extension to LADM for State Land. Identifies the party as being a property manager. ');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('team', 'Team', 'c', 'Extension to LADM for State Land. Identifies the party as being a team. ');


ALTER TABLE party_role_type ENABLE TRIGGER ALL;

--
-- Data for Name: party_type; Type: TABLE DATA; Schema: party; Owner: postgres
--

ALTER TABLE party_type DISABLE TRIGGER ALL;

INSERT INTO party_type (code, display_value, status, description) VALUES ('baunit', 'Basic Administrative Unit::::Базовая Административная Единица::::الطابو::::Unité Administrative de Base', 'c', '...::::::::...::::...');
INSERT INTO party_type (code, display_value, status, description) VALUES ('group', 'Group::::Группа::::مجموعة::::Groupe', 't', '...::::::::...::::...');
INSERT INTO party_type (code, display_value, status, description) VALUES ('naturalPerson', 'Natural Person::::Физическое лицо::::شخص طبيعي::::Personne Physique', 'c', '...::::::::...::::...');
INSERT INTO party_type (code, display_value, status, description) VALUES ('nonNaturalPerson', 'Non-natural Person::::Организация::::شخص اعتباري::::Personne Non Physique', 'c', '...::::::::...::::...');


ALTER TABLE party_type ENABLE TRIGGER ALL;

SET search_path = source, pg_catalog;

--
-- Data for Name: administrative_source_type; Type: TABLE DATA; Schema: source; Owner: postgres
--

ALTER TABLE administrative_source_type DISABLE TRIGGER ALL;

INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('lease', 'Lease::::Договор Аренды::::تأجير::::Bail', 'c', '...::::::::...::::...', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('cadastralSurvey', 'Cadastral Survey::::Кадастровая Съемка::::مسح الاراضي::::Relevé Cadastral', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('contractForSale', 'Contract for Sale::::Договор о Продаже::::عقد بيع::::Contrat de Vente', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('standardDocument', 'Standard Document::::Стандартный Документ::::وثيقة مرجعية::::Document Standard', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM', true);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('title', 'Title::::Право Собственности::::سند ملكية::::Titre', 'c', '...::::::::...::::...', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('tif', 'Tif Scanned Document::::Отсканированный Документ TIF::::وثيقة Tif  ممسوحة.::::Document Scanné en TIF', 'x', '...::::::::...::::...', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('idVerification', 'Form of Identification including Personal ID::::Форма удостоверения включая персональный ID::::نموذج تعريف شخصي::::Formulaire d''identification incluant le document d''identité personnel', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('deed', 'Deed::::Сделка::::عمل::::Acte', 'c', '...::::::::...::::...', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('objection', 'Objection  document::::Документ Обжалования::::وثيقة اعتراض::::Document d''Objection', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('waiver', 'Waiver to Caveat or other requirement::::Ходатайство о приостановке судебного разбирательства::::تنازل  عن قيد  أو شرط آخر::::Dispense d''Opposition / Caveat ou autre condition', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('jpg', 'Jpg Scanned Document::::Отсканированный Документ JPEG::::وثيقة Jpg ممسوحة::::Document Scanné en JPG', 'x', '...::::::::...::::...', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('agreement', 'Agreement::::Соглашение::::اتفاقية::::Accord', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('caveat', 'Caveat::::Протест::::الموانع::::Caveat', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('pdf', 'Pdf Scanned Document::::Отсканированный Документ PDF::::وثيقة Pdf ممسوحة::::Document Scanné en PDF', 'x', '...::::::::...::::...', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('agriConsent', 'Agricultural Consent::::Сельскохозяйственное Разрешение::::الموافقة الزراعية::::Consentement Agricole', 'x', '...::::::::...::::...', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('mortgage', 'Mortgage::::Ипотека::::رهن::::Hypothèque', 'c', '...::::::::...::::...', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('powerOfAttorney', 'Power of Attorney::::Доверенность::::وكالة::::Procuration', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM', true);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('proclamation', 'Proclamation::::Прокламация::::إعلان::::Proclamation', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('agriNotaryStatement', 'Agricultural Notary Statement::::Нотариальное Сельскохозяйственное Заявление::::بيان كاتب العدل الزراعية::::Déclaration Agricole Notariée', 'x', '...::::::::...::::...', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('courtOrder', 'Court Order::::Судебное Решение::::امر محكمة::::Décision de Justice', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('cadastralMap', 'Cadastral Map::::Кадастровая Карта::::خارطة المساحة::::Plan Cadastral', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('systematicRegn', 'Systematic Registration Application::::Заявление на Системную Регистрацию::::طلب تسجيل منتظم::::Demande Enregistrement Systématique', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('publicNotification', 'Public Notification for Systematic Registration::::Публичное Уведомление о Системной Регистрации::::اعلان عام للتسجيل المنتظم::::Notification Publique pour Enregistrement Systématique', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('will', 'Will::::Завещание::::وصية::::Testament', 'c', 'Extension to LADM::::Расширение LADM::::...::::Extension au LADM', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('tiff', 'Tiff Scanned Document::::Отсканированный Документ TIFF::::وثيقة ممسوحة (Tiff)::::Document Scanné en TIFF', 'x', '...::::::::::::...', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('agriLease', 'Agricultural Lease::::Сельскохозяйственная Аренда::::اجارة زراعية::::Bail Agricole', 'x', '...::::::::::::...', false);


ALTER TABLE administrative_source_type ENABLE TRIGGER ALL;

--
-- Data for Name: availability_status_type; Type: TABLE DATA; Schema: source; Owner: postgres
--

ALTER TABLE availability_status_type DISABLE TRIGGER ALL;

INSERT INTO availability_status_type (code, display_value, status, description) VALUES ('archiveConverted', 'Converted::::Сконвертированный::::محولة::::Converti', 'c', '');
INSERT INTO availability_status_type (code, display_value, status, description) VALUES ('archiveDestroyed', 'Destroyed::::Уничтоженный::::متلفة::::Détruit', 'x', '');
INSERT INTO availability_status_type (code, display_value, status, description) VALUES ('incomplete', 'Incomplete::::Незаконченный::::غير مكتملة::::Incomplet', 'c', '');
INSERT INTO availability_status_type (code, display_value, status, description) VALUES ('archiveUnknown', 'Unknown::::Неизвестный::::غير معروفة::::Inconnu', 'c', '');
INSERT INTO availability_status_type (code, display_value, status, description) VALUES ('available', 'Available::::Доступный::::متوفرة::::Disponible', 'c', 'Extension to LADM::::Extension to LADM::::Extension to LADM::::Extension au LADM');


ALTER TABLE availability_status_type ENABLE TRIGGER ALL;

--
-- Data for Name: presentation_form_type; Type: TABLE DATA; Schema: source; Owner: postgres
--

ALTER TABLE presentation_form_type DISABLE TRIGGER ALL;

INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('modelDigital', 'Digital Model::::Цифровая Модель::::نموذج رقمي::::Modèle Numérique', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('modelHarcopy', 'Hardcopy Model::::Бумажная Модель::::نموذج ورقي::::Modèle Papier', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('profileDigital', 'Digital Profile::::Цифровое Дело::::ملف شخصي رقمي::::Profil Numérique', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('documentDigital', 'Digital Document::::Цифровой Документ::::وثيقة رقمية::::Document Numérique', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('profileHardcopy', 'Hardcopy Profile::::Бумажное Дело::::ملف شخصي ورقي::::Profil Papier', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('documentHardcopy', 'Hardcopy Document::::Бумажный Документ::::وثيقة ورقية::::Document Papier', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('imageDigital', 'Digital Image::::Цифровое Изображение::::صورة رقمية::::Image Numérique', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('tableDigital', 'Digital Table::::Цифровая Таблица::::جدول رقمي::::Table Numérique', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('imageHardcopy', 'Hardcopy Image::::Бумажное Изображение::::صورة ورقية::::Image Papier', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('mapDigital', 'Digital Map::::Цифровая Карты::::خارطة رقمية::::Plan Numérique', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('tableHardcopy', 'Hardcopy Table::::Бумажная Таблица::::جدول ورقي::::Table Papier', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('mapHardcopy', 'Hardcopy Map::::Бумажная Карта::::خارطة ورقية::::Plan Papier', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('videoDigital', 'Digital Video::::Цифровое Видео::::شريط فيديو رقمي::::Vidéo Numérique', 'c', '');
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('videoHardcopy', 'Hardcopy Video::::Видео на носителе::::شريط فيديو::::Vidéo Analogue', 'c', '');


ALTER TABLE presentation_form_type ENABLE TRIGGER ALL;

--
-- Data for Name: spatial_source_type; Type: TABLE DATA; Schema: source; Owner: postgres
--

ALTER TABLE spatial_source_type DISABLE TRIGGER ALL;

INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('cadastralSurvey', 'Cadastral Survey::::Кадастровая Съемка::::المسح::::Levé Cadastral', 'c', 'Extension to LADM::::Расширение LADM::::Extension to LADM::::Extension au LADM');
INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('surveyData', 'Survey Data (Coordinates)::::Данные Съемки (Координаты)::::احداثيات المسح::::Données de Levé (Coordonnées)', 'c', 'Extension to LADM::::Расширение LADM::::Extension to LADM::::Extension au LADM');
INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('fieldSketch', 'Field Sketch::::Полевая Схема::::رسم الحقل::::Croquis de terrain', 'c', '');
INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('gnssSurvey', 'GNSS (GPS) Survey::::Съемка GNSS (GPS)::::مسح جي بي اس::::Levé GNSS (GPS)', 'c', '');
INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('orthoPhoto', 'Orthophoto::::Аэрофотография::::الصور الجوية المعدلة::::Orthophoto', 'c', '');
INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('relativeMeasurement', 'Relative Measurements::::Относительные Измерения::::القياسات المرتبطة::::Mesures Relatives', 'c', '');
INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('topoMap', 'Topographical Map::::Топологическая Карта::::خارطة طبوغرافية::::Plan Topographique', 'c', '');
INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('video', 'Video::::Видео::::شريط فيديو::::Vidéo', 'c', '');


ALTER TABLE spatial_source_type ENABLE TRIGGER ALL;

SET search_path = system, pg_catalog;

--
-- Data for Name: approle; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE approle DISABLE TRIGGER ALL;

INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnEdit', 'Application - Edit & Save::::Application - Edit & Save::::حركة طلب- تعديل وحفظ::::Demande - Edit & Save', 'c', 'Allows application details to be edited and saved. ::::Allows application details to be edited and saved.::::Allows application details to be edited and saved.::::Permet d''éditer et sauvegarder les détails de la demande.');
INSERT INTO approle (code, display_value, status, description) VALUES ('SourceSave', 'Document - Save::::Document - Save::::الوثائق-حفظ::::Document - Sauvegarder', 'c', 'Allows document details to be edited and saved::::Allows document details to be edited and saved::::Allows document details to be edited and saved::::Permet d''éditer et sauvegarder les détails de documents.');
INSERT INTO approle (code, display_value, status, description) VALUES ('RHSave', 'Party - Save Rightholder::::Party - Save Rightholder::::الطرف-حفظ صاحب حق::::Partie - Sauvegarder Détenteur de Droits', 'c', 'Allows parties that are rightholders to be edited and saved.::::Allows parties that are rightholders to be edited and saved.::::Allows parties that are rightholders to be edited and saved.::::Permet d''éditer et de sauvegarder le(s) détenteur(s) de droits.');
INSERT INTO approle (code, display_value, status, description) VALUES ('BaunitSave', 'Property - Edit & Save::::Property - Edit & Save::::الملكية-تعديل وحفظ::::Propriété - Editer & Sauvegarder', 'c', 'Allows property details to be edited and saved.::::Allows property details to be edited and saved.::::Allows property details to be edited and saved.::::Permet d''éditer et sauvegarder les détails de la propriété.');
INSERT INTO approle (code, display_value, status, description) VALUES ('newDigitalTitle', 'Service - Convert Title::::Service - Convert Title::::الخدمة-تحويل ملكية::::Service - Convertir Titre', 'c', 'Registration Service. Allows the Convert Title service to be started. ::::Registration Service. Allows the Convert Title service to be started.::::Registration Service. Allows the Convert Title service to be started.::::Service Enregistrement. Permet au Service - Convertir Titre de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnView', 'Application - Search & View::::Application - Search & View::::الطلب-البحث والعرض::::Demande - Rechercher et Visualiser', 'c', 'Allows users to search and view application details.::::Allows users to search and view application details.::::Allows users to search and view application details.::::Permet à l''utilisateur de rechercher et visualiser les détails d''une demande.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnUnassignOthers', 'Application - Unassign from Others::::Application - Unassign from Others::::طلب-الغاء التعيين::::Demande - Non assignation aux autres', 'c', 'Allows the user to unassign an application from any user. ::::Allows the user to unassign an application from any user.::::Allows the user to unassign an application from any user.::::Permet à l''utilisateur de retirer une demande à un autre utilisateur.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnDispatch', 'Appln Action - Dispatch::::Appln Action - Dispatch::::جركة طلب-توزيع::::Action Demande - Envoyer', 'c', 'Required to perform the Dispatch application action. Used to indicate that documents have been dispatched to applicant along with any certificates/reports/map prints requested by applicant::::Required to perform the Dispatch application action. Used to indicate that documents have been dispatched to applicant along with any certificates/reports/map prints requested by applicant::::Required to perform the Dispatch application action. Used to indicate that documents have been dispatched to applicant along with any certificates/reports/map prints requested by applicant::::Requis pour pouvoir effectuer l''action d''envoi de la demande. Utilisé pour indiquer que les documents ont été envoyés au demandeur avec certificats / rapports / impression de plan requis par le demandeur.');
INSERT INTO approle (code, display_value, status, description) VALUES ('SourceSearch', 'Document - Search & View::::Document - Search & View::::الوثائق- البحث والعرض::::Document - Rechercher & Visualiser', 'c', 'Allows users to search for documents.::::Allows users to search for documents.::::Allows users to search for documents.::::Permet à l''utilisateur de rechercher et visualiser des documents.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ParcelSave', 'Parcel - Edit & Save::::Parcel - Edit & Save::::القطع-تعديل و حفظ::::Parcelle - Editer & Sauvegarder', 'c', 'Allows parcel details to be edited and saved.::::Allows parcel details to be edited and saved.::::Allows parcel details to be edited and saved.::::Permet d''éditer et sauvegarder les détails de la parcelle.');
INSERT INTO approle (code, display_value, status, description) VALUES ('PartySave', 'Party - Edit & Save::::Party - Edit & Save::::الطرف-تعديل وحفظ::::Partie - Editer & Sauvegarder', 'c', 'Allows party details to be edited and saved unless the party is a rightholder. ::::Allows party details to be edited and saved unless the party is a rightholder.::::Allows party details to be edited and saved unless the party is a rightholder.::::Permet d''éditer et sauvegarder les détails des parties à moins que la partie soit un détenteur de droits.');
INSERT INTO approle (code, display_value, status, description) VALUES ('cadastrePrint', 'Service - Cadastre Print::::Service - Cadastre Print::::الخدمة-طباعة مساحة::::Service - Imprimer Cadastre', 'c', 'Supporting Service. Allows the Cadastre Print service to be started. ::::Supporting Service. Allows the Cadastre Print service to be started.::::Supporting Service. Allows the Cadastre Print service to be started.::::Service Soutien. Permet au Service - Imprimer Cadastre de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('newOwnership', 'Service - Chance of Ownership::::Service - Chance of Ownership::::الخدمة-تغيير اصحاب الملكية::::Service - Changement de Propriétaire', 'c', 'Registration Service. Allows the Change of Ownership service to be started. ::::Registration Service. Allows the Change of Ownership service to be started.::::Registration Service. Allows the Change of Ownership service to be started.::::Service Enregistrement. Permet au Service - Changement de Propriétaire de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('documentCopy', 'Service - Document Copy::::Service - Document Copy::::الحدمة-نسخ وثيقة::::Service - Copier Document', 'c', 'Supporting Service. Allows the Document Copy service to be started.::::Supporting Service. Allows the Document Copy service to be started.::::Supporting Service. Allows the Document Copy service to be started.::::Service Soutien. Permet au Service - Copier Document de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('varyLease', 'Service - Vary Lease::::Service - Vary Lease::::الخدمة- تغيير ايجار::::Service - Varier Bail', 'c', 'Registration Service. Allows the Vary Lease service to be started. ::::Registration Service. Allows the Vary Lease service to be started.::::Registration Service. Allows the Vary Lease service to be started.::::Service Enregistrement. Permet au Service - Varier Bail de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('RightsExport', 'Reporting - Rights Export::::Reporting - Rights Export::::التقارير- تصدير الحقوق::::Reporting - Export Droits', 'c', 'Allows user to export rights informaiton into CSV format.  ::::Allows user to export rights informaiton into CSV format.::::Allows user to export rights informaiton into CSV format.::::Permet à l''utilisateur d''exporter les informations des droits au format CSV.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnUnassignSelf', 'Application - Unassign from Self::::Application - Unassign from Self::::طلب-الغاء التعيين الذاتي::::Demande - Auto non assignation', 'c', 'Allows a user to unassign an application from themselves. ::::Allows a user to unassign an application from themselves.::::Allows a user to unassign an application from themselves.::::Permet à l''utilisateur de s''auto-retirer une demande.');
INSERT INTO approle (code, display_value, status, description) VALUES ('slObjection', 'Service - Manage Objections', 'c', 'State Land Service. Allows the Manage Objections service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('SourcePrint', 'Document - Print::::Document - Print::::الوثائق-طباعة::::Document - Imprimer', 'c', 'Allows users to print documents directly from SOLA. ::::Allows users to print documents directly from SOLA.::::Allows users to print documents directly from SOLA.::::Permet à l''utilisateur d''imprimer des documents directement depuis SOLA.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ExportMap', 'Map - KML Export::::Map - KML Export::::الخارطة-تصدير ل KML::::Plan - Export KML', 'c', 'Allows the user to export selected features from the map as KML.::::Allows the user to export selected features from the map as KML.::::Allows the user to export selected features from the map as KML.::::Permet à l''utilisateur d''exporter les éléments sélectionnés dans le plan au format KML.');
INSERT INTO approle (code, display_value, status, description) VALUES ('BaunitSearch', 'Property - Search::::Property - Search::::الملكية- البحث::::Propriété - Recherche', 'c', 'Allows users to search for properties. ::::Allows users to search for properties.::::Allows users to search for properties.::::Permet à l''utilisateur de rechercher une propriété.');
INSERT INTO approle (code, display_value, status, description) VALUES ('newFreehold', 'Service - Freehold Title::::Service - Freehold Title::::الخدمة-سند ملكية::::Service - Titre de Propriété', 'c', 'Registration Service. Allows the Freehold Title service to be started.::::Registration Service. Allows the Freehold Title service to be started.::::Registration Service. Allows the Freehold Title service to be started.::::Service Enregistrement. Permet au Service - Titre de Propriété de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ManageBR', 'Admin - Business Rules::::Admin - Business Rules::::ادارة-قواعد الاعمال::::Admin - Règles Métiers (BR)', 'c', 'Allows system administrators to manage (edit and save) business rules.::::Allows system administrators to manage (edit and save) business rules.::::Allows system administrators to manage (edit and save) business rules.::::Permet à l''administrateur système de gérer (éditer et sauvegarder) les règles métiers.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ViewMap', 'Map - View::::Map - View::::الخارطة- عرض::::Plan - Visualiser', 'c', 'Allows the user to view the map. ::::Allows the user to view the map.::::Allows the user to view the map.::::Permet à l''utilisateur de visualizer le plan.');
INSERT INTO approle (code, display_value, status, description) VALUES ('lodgeObjection', 'Service - Lodge Objection::::Service - Lodge Objection::::الخدمة-ايداع اعتراض::::Service - Dépôt d''Objection', 'c', 'Systematic Registration Service. Allows the Lodge Objection service to be started.::::Systematic Registration Service. Allows the Lodge Objection service to be started.::::Systematic Registration Service. Allows the Lodge Objection service to be started.::::Service Enregistrement Systématique. Permet au Service - Dépôt d''Objection de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('servitude', 'Service - Register Servitude::::Service - Register Servitude::::الخدمة-تسجيل حق انتفاع::::Service - Enregistrement de Servitude', 'c', 'Registration Service. Allows the Register Servitude service to be started. ::::Registration Service. Allows the Register Servitude service to be started.::::Registration Service. Allows the Register Servitude service to be started.::::Service Enregistrement. Permet au Service - Enregistrement de Servitude de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('PartySearch', 'Party - Search & View::::Party - Search & View::::الطرف-البحث والعرض::::Partie - Rechercher & Visualiser', 'c', 'Allows user to search and view party details.::::Allows user to search and view party details.::::Allows user to search and view party details.::::Permet à l''utilisateur de rechercher et visualiser les détails d''une partie.');
INSERT INTO approle (code, display_value, status, description) VALUES ('historicOrder', 'Service - Register Historic Preservation Order::::Service - Register Historic Preservation Order::::الخدمة-تسجيل امر حفظ تاريخي::::Service - Enregistrement d''Ordre de Préservation Historique', 'c', 'Registration Service. Allows the Register Historic Preservation Order service to be started. ::::Registration Service. Allows the Register Historic Preservation Order service to be started.::::Registration Service. Allows the Register Historic Preservation Order service to be started.::::Service Enregistrement. Permet au Service - Enregistrement d''Ordre de Préservation Historique de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('systematicRegn', 'Service - Systematic Registration Claim::::Service - Systematic Registration Claim::::الخدمة-المطالبة بتسجيل منتظم::::Service - Déclaration Enregistrement Systématique', 'c', 'Systematic Registration Service - Allows the Systematic Registration Claim service to be started. ::::Systematic Registration Service - Allows the Systematic Registration Claim service to be started.::::Systematic Registration Service - Allows the Systematic Registration Claim service to be started.::::Service Enregistrement Systématique. Permet au Service - Déclaration Enregistrement Systématique de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('removeRestriction', 'Service - Remove Restriction::::Service - Remove Restriction::::الخدمة-ازالة قيد::::Service - Supprimer Restriction', 'c', 'Registration Service. Allows the Remove Restriction service to be started. ::::Registration Service. Allows the Remove Restriction service to be started.::::Registration Service. Allows the Remove Restriction service to be started.::::Service Enregistrement. Permet au Service - Supprimer Restriction de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnResubmit', 'Appln Action - Resubmit::::Appln Action - Resubmit::::حركة طلب-اعادة تقديم::::Action Demande - Resoumettre', 'c', 'Required to perform the Resubmit applicaiton action. The Resubmit action transitions the application into the Lodged state if it is currently On Hold. ::::Required to perform the Resubmit applicaiton action. The Resubmit action transitions the application into the Lodged state if it is currently On Hold.::::Required to perform the Resubmit applicaiton action. The Resubmit action transitions the application into the Lodged state if it is currently On Hold.::::Requis pour pouvoir effectuer l''action de resubmission de la demande. L''action de resubmission transfert la demande en statut "déposé" si celui-ci est pour le moment "en attente".');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnCreate', 'Application - Lodge::::Application - Lodge::::جركة طلب-ايداع::::Demande - Déposer', 'c', 'Allows new application details to be created (lodged). ::::Allows new application details to be created (lodged).::::Allows new application details to be created (lodged).::::Permet de créer les détails de la nouvelle demande (déposé).');
INSERT INTO approle (code, display_value, status, description) VALUES ('mortgage', 'Service - Register Mortgage::::Service - Register Mortgage::::الخدمة-تسجيل رهن::::Service - Enregistrement d''une Hypothèque', 'c', 'Registration Service. Allows the Register Mortgage service to be started. ::::Registration Service. Allows the Register Mortgage service to be started.::::Registration Service. Allows the Register Mortgage service to be started.::::Service Enregistrement. Permet au Service - Enregistrement d''une Hypothèque de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('registerLease', 'Service - Register Lease::::Service - Register Lease::::الخدمة-تسجيل ايجار::::Service - Enregistrement Bail', 'c', 'Registration Service. Allows the Register Lease service to be started. ::::Registration Service. Allows the Register Lease service to be started.::::Registration Service. Allows the Register Lease service to be started.::::Service Enregistrement. Permet au Service - Enregistrement Bail de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('publicDisplayMap', 'Service - Public Display Map', 'c', 'State Land Service. Allows the Public Display Map service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('caveat', 'Service - Register Caveat::::Service - Register Caveat::::الخدمة-تسجيل مانع::::Service - Enregistrement Caveat', 'c', 'Registration Service. Allows the Register Caveat service to be started. ::::Registration Service. Allows the Register Caveat service to be started.::::Registration Service. Allows the Register Caveat service to be started.::::Service Enregistrement. Permet au Service - Enregistrement Caveat de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('removeCaveat', 'Service - Remove Caveat::::Service - Remove Caveat::::الخدمة-ازالة مانع::::Service - Supprimer Caveat', 'c', 'Registration Service. Allows the Remove Caveat service to be started. ::::Registration Service. Allows the Remove Caveat service to be started.::::Registration Service. Allows the Remove Caveat service to be started.::::Service Enregistrement. Permet au Service - Supprimer Caveat de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('surveyPlanCopy', 'Service - Survey Plan Copy::::Service - Survey Plan Copy::::الخدمة-نسخ خطة مسح::::Service - Copier Plan de Levé', 'c', 'Supporting Service. Allows the Survey Plan Copy service to be started. ::::Supporting Service. Allows the Survey Plan Copy service to be started.::::Supporting Service. Allows the Survey Plan Copy service to be started.::::Service Soutien. Permet au Service - Copier Plan de Levé de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('varyMortgage', 'Service - Vary Mortgage::::Service - Vary Mortgage::::الخدمة-تغيير رهن::::Service - Varier Hypothèque', 'c', 'Registration Service. Allows the Vary Mortgage service to be started.::::Registration Service. Allows the Vary Mortgage service to be started.::::Registration Service. Allows the Vary Mortgage service to be started.::::Service Enregistrement. Permet au Service - Varier Hypothèque de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('varyCaveat', 'Service - Vary Caveat::::Service - Vary Caveat::::الخدمة-تغيير مانع::::Service - Varier Caveat', 'c', 'Registration Service. Allows the Vary Caveat service to be started. ::::Registration Service. Allows the Vary Caveat service to be started.::::Registration Service. Allows the Vary Caveat service to be started.::::Service Enregistrement. Permet au Service - Varier Caveat de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('CompleteService', 'Service Action - Complete::::Service Action - Complete::::حركة خدمة-اكمال::::Action Service - Exécuter', 'c', 'Allows any service to be completed::::Allows any service to be completed::::Allows any service to be completed::::Permet à n''importe quel service d''être exécuté');
INSERT INTO approle (code, display_value, status, description) VALUES ('CancelService', 'Service Action - Cancel::::Service Action - Cancel::::حركة خدمة-الغاء::::Action Service - Annuler', 'c', 'Allows any service to be cancelled.::::Allows any service to be cancelled.::::Allows any service to be cancelled.::::Permet à n''importe quel service d''être annulé.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnValidate', 'Appln Action - Validate::::Appln Action - Validate::::حركة طلب- التحقق من صحة البيانات::::Action Demande - Valider', 'c', 'Required to perform the Validate applicaiton action. Allows the user to manually run the validation rules against the application. ::::Required to perform the Validate applicaiton action. Allows the user to manually run the validation rules against the application.::::Required to perform the Validate applicaiton action. Allows the user to manually run the validation rules against the application.::::Requis pour pouvoir effectuer l''action de demande de validation. Permet à l''utilisateur de confronter manuellement les règles de validation à la demande.');
INSERT INTO approle (code, display_value, status, description) VALUES ('redefineCadastre', 'Service - Redefine Cadastre::::Service - Redefine Cadastre::::الخدمة-اعادة تعريف المساحة::::Service - Redéfinition du Cadastre', 'c', 'Survey Service. Allows the Redefine Cadastre service to be started. ::::Survey Service. Allows the Redefine Cadastre service to be started.::::Survey Service. Allows the Redefine Cadastre service to be started.::::Service Levé Cadastral. Permet au Service - Redéfinition du Cadastre de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('serviceEnquiry', 'Service - Service Enquiry::::Service - Service Enquiry::::الخدمة-الاستفسار عن خدمة::::Service - Service Enquête', 'c', 'Supporting Service. Allow the Service Enquiry service to be started.::::Supporting Service. Allow the Service Enquiry service to be started.::::Supporting Service. Allow the Service Enquiry service to be started.::::Service Soutien. Permet au Service - Service Enquête de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('RevertService', 'Service Action - Revert::::Service Action - Revert::::حركة خدمة-التراجع::::Action Service - Retourner en arrière', 'c', 'Allows any completed service to be reverted to a Pending status for further action. ::::Allows any completed service to be reverted to a Pending status for further action.::::Allows any completed service to be reverted to a Pending status for further action.::::Permet à n''importe quel service exécuté d''être revu et retourné en arrière, au statut en attente avant de passer à une action suivante.');
INSERT INTO approle (code, display_value, status, description) VALUES ('NoPasswordExpiry', 'Admin - No Password Expiry::::Admin - No Password Expiry::::ادارة-صلاحية كلمة المرور::::Admin - Non expiration de Mot de Passe', 'c', 'Users with no password expiry (used by other systems using SOLA web services). Password expiry is configured using pword-expiry-days system.setting::::Users with no password expiry (used by other systems using SOLA web services). Password expiry is configured using pword-expiry-days system.setting::::Users with no password expiry (used by other systems using SOLA web services). Password expiry is configured using pword-expiry-days system.setting::::Les utilisateurs ayant un rôle ne feront pas l''objet d''une expiration de leur mot de passe s''ils en not un. Ce rôle peut être assigné aux comptes utilisateur utisilés par d''autres systèmes à intégrer avec les services Web de SOLA. Notez que cette expiration du mot de passe peut être configurée en utilisant le pword-expiry-days system.setting');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnAssignOthers', 'Application - Assign to Other Users::::Application - Assign to Other Users::::جركة طلب- تعيين لمستحدمين اخرين::::Demande - Assignation à un autre', 'c', 'Allows a user to assign an application to any other user in the same security groups they are in. ::::Allows a user to assign an application to any other user in the same security groups they are in.::::Allows a user to assign an application to any other user in the same security groups they are in.::::Permet à l''utilisateur d''assigner une demande à n''importe quel autre utilisateur du même group de sécurité.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnWithdraw', 'Appln Action - Withdraw::::Appln Action - Withdraw::::حركة طلب-سحب::::Action Demande - Retirer', 'c', 'Required to perform the Withdraw applicaiton action. The Withdraw action transitions the application into the Annulled state.  ::::Required to perform the Withdraw applicaiton action. The Withdraw action transitions the application into the Annulled state.::::Required to perform the Withdraw applicaiton action. The Withdraw action transitions the application into the Annulled state.::::Requis pour retirer une demande. L''action Retirer fait le lien avec la demande d''annulation.');
INSERT INTO approle (code, display_value, status, description) VALUES ('titleSearch', 'Service - Title Search::::Service - Title Search::::الخدمة-البحث عن ملكية::::Service - Recherche Titre', 'c', 'Supporting Service. Allows the Title Search service to be started. ::::Supporting Service. Allows the Title Search service to be started.::::Supporting Service. Allows the Title Search service to be started.::::Service Soutien. Permet au Service - Recherche Titre de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnReject', 'Appln Action - Cancel::::Appln Action - Cancel::::Appln Action - Cancel::::Action Demande - Annuler', 'c', 'Required to perform the Cancel applicaiton action. The Cancel action transitions the application into the Annulled state.  ::::Required to perform the Cancel applicaiton action. The Cancel action transitions the application into the Annulled state.::::Required to perform the Cancel applicaiton action. The Cancel action transitions the application into the Annulled state.::::Requis pour pouvoir effectuer l''action d''annulation de la demande. L''action d''annulation transforme le statut de la demande en "Annulé".');
INSERT INTO approle (code, display_value, status, description) VALUES ('DashbrdViewUnassign', 'Dashboard - View Unassigned::::Dashboard - View Unassigned::::لوحة المراقبة-مشاهدة الطلبات الغير معينة::::Accueil - Visulaiser Non Assignée', 'c', 'Allows the user to view all unassigned applications in the Dashboard. To hide the Dashboard from the user, remove both this role and the Dashboard - View Assigned role. ::::Allows the user to view all unassigned applications in the Dashboard. To hide the Dashboard from the user, remove both this role and the Dashboard - View Assigned role.::::Allows the user to view all unassigned applications in the Dashboard. To hide the Dashboard from the user, remove both this role and the Dashboard - View Assigned role.::::Permet à l''utilisateur de visualiser routes les demandes non assignées dans l''accueil. Pour cacher l''Accueil de l''utilisateur, supprimer ce rôle et le rôle Accueil - Visualiser Assigné.');
INSERT INTO approle (code, display_value, status, description) VALUES ('PrintMap', 'Map - Print::::Map - Print::::الخارطة-طباعة::::Plan - Imprimer', 'c', 'Allows the user to create printouts from the Map::::Allows the user to create printouts from the Map::::Allows the user to create printouts from the Map::::Permet à l''utilisateur de créer des plans à imprimer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('BaunitCertificate', 'Property - Print Certificate::::Property - Print Certificate::::الملكية-طباعة الشهادة::::Propriété - Imprimer Certificat', 'c', 'Allows the user to generate a property certificate. ::::Allows the user to generate a property certificate.::::Allows the user to generate a property certificate.::::Permet à l''utilisateur de générer un certificat de propriété.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ReportGenerate', 'Reporting - Management Reports::::Reporting - Management Reports::::تقارير-ادارة التقارير::::Reporting - Rapport de Management', 'c', 'Allows users to generate and view management reports (e.g. Lodgement Report)::::Allows users to generate and view management reports (e.g. Lodgement Report)::::Allows users to generate and view management reports (e.g. Lodgement Report)::::Permet à l''utilisateur de générer et visualiser les rapports de management (ex: Liste des dépôts)');
INSERT INTO approle (code, display_value, status, description) VALUES ('regnOnTitle', 'Service - Registration on Title::::Service - Registration on Title::::الخدمة-تسجيل سند ملكية::::Service - Enregistrement du Titre', 'c', 'Registration Service. Allows the Registration on Title service to be started. ::::Registration Service. Allows the Registration on Title service to be started.::::Registration Service. Allows the Registration on Title service to be started.::::Service Enregistrement. Permet au Service - Enregistrement du Titre de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('varyRight', 'Service - Vary Right (General)::::Service - Vary Right (General)::::الخدمة-تغيير حق (عام)::::Service - Varier Droit (Général)', 'c', 'Registration Service. Allows the Vary Right (General) service to be started. ::::Registration Service. Allows the Vary Right (General) service to be started.::::Registration Service. Allows the Vary Right (General) service to be started.::::Service Enregistrement. Permet au Service - Varier Droit (Général) de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('cnclStandardDocument', 'Service - Withdraw Standard Document::::Service - Withdraw Standard Document::::الحدمة-سحب وثيقة معيارية::::Service - Retirer Document Standard', 'c', 'Registration Service. Allows the Withdraw Standard Document service to be started. ::::Registration Service. Allows the Withdraw Standard Document service to be started.::::Registration Service. Allows the Withdraw Standard Document service to be started.::::Service Enregistrement. Permet au service Retirer Document Standard de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ManageSettings', 'Admin - System Settings::::Admin - System Settings::::ادارة-اعدادات النظام::::Admin - Paramètres Système', 'c', 'Allows system administrators to manage (edit and save) system setting details. Users with this role will be able to login to the SOLA Admin application. ::::Allows system administrators to manage (edit and save) system setting details. Users with this role will be able to login to the SOLA Admin application.::::Allows system administrators to manage (edit and save) system setting details. Users with this role will be able to login to the SOLA Admin application.::::Permet à l''administrateur système de gérer (éditer et sauvegarder) les détails des paramètres du système. Les utilisateurs avec ce rôle peuvent se connecter à l''application SOLA Admin.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ManageSecurity', 'Admin - Users and Security::::Admin - Users and Security::::ادارة-المستخدمين وسرية النظام::::Admin - Utilisateurs et Sécurité', 'c', 'Allows system administrators to manage (edit and save) users, groups and roles. Users with this role will be able to login to the SOLA Admin application. ::::Allows system administrators to manage (edit and save) users, groups and roles. Users with this role will be able to login to the SOLA Admin application.::::Allows system administrators to manage (edit and save) users, groups and roles. Users with this role will be able to login to the SOLA Admin application.::::Permet à l''administrateur système de gérer (éditer et sauvegarder) les utilisateurs, groupes et rôles. Les utilisateurs avec ce rôle peuvent se connecter à l''application SOLA Admin.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnAssignSelf', 'Application - Assign to Self::::Application - Assign to Self::::تعيين ذاتي::::Demande - Auto Assignation', 'c', 'Allows a user to assign an application to themselves.::::Allows a user to assign an application to themselves.::::Allows a user to assign an application to themselves.::::Permet à l''utilisateur de s''auto-assigner une demande.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnStatus', 'Application - Status Report::::Application - Status Report::::طلب-تقرير الحالة::::Demande - Liste par Statut', 'c', 'Allows the user to print a status report for the application.::::Allows the user to print a status report for the application.::::Allows the user to print a status report for the application.::::Permet à l''utilisateur d''imprimer une liste des demandes par statut.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnRequisition', 'Appln Action - Requisition::::Appln Action - Requisition::::حركة طلب-طلب معلومات::::Action Demande - Réquisitionner', 'c', 'Required to perform the Requisition applicaiton action. The Requisition action transitions the application into the Requisitioned state. ::::Required to perform the Requisition applicaiton action. The Requisition action transitions the application into the Requisitioned state.::::Required to perform the Requisition applicaiton action. The Requisition action transitions the application into the Requisitioned state.::::Requis pour pouvoir effectuer l''action de réquisition de la demande. L''action de réquisition transforme le statut de la demande en "Réquisitionné".');
INSERT INTO approle (code, display_value, status, description) VALUES ('publicDisplay', 'Service - Manage Public Display', 'c', 'State Land Service. Allows the Manage Public Display service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('BulkApplication', 'Bulk Operations - Login ::::Bulk Operations - Login::::عمليات الحزمة- تسجيل الدخول::::Opérations Massive - Connection', 'c', 'Allows the user to login and use the Bulk Operations application. ::::Allows the user to login and use the Bulk Operations application.::::Allows the user to login and use the Bulk Operations application.::::Permet à l''utilisateur de se connecter et d''utiliser l''application d''Opération Massive.');
INSERT INTO approle (code, display_value, status, description) VALUES ('TransactionCommit', 'Doc Registration - Save::::Doc Registration - Save::::تسجيل وثيقة-حفظ::::Enregistrement Doc - Sauvegarder', 'c', 'Allows documents for registration such as Power of Attorney and Standard Documents to be saved on the Document Registration screen. ::::Allows documents for registration such as Power of Attorney and Standard Documents to be saved on the Document Registration screen.::::Allows documents for registration such as Power of Attorney and Standard Documents to be saved on the Document Registration screen.::::Permet de sauvegarder des documents pour l''enregistrement tels que Procuration ou Document Standard Documents depuis l''écran d''enregistrement de Document.');
INSERT INTO approle (code, display_value, status, description) VALUES ('cnclPowerOfAttorney', 'Service - Cancel Power of Attorney::::Service - Cancel Power of Attorney::::الخدمة-الغاء وكالة::::Service - Annuler Procuration', 'c', 'Registration Service. Allows the Cancel Power of Attorney service to be started::::Registration Service. Allows the Cancel Power of Attorney service to be started::::Registration Service. Allows the Cancel Power of Attorney service to be started::::Service Enregistrement. Permet au Service - Annuler Procuration de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('cadastreChange', 'Service - Change to Cadastre::::Service - Change to Cadastre::::الخدمة-تغيير مساحة::::Service - Modification du Cadastre', 'c', 'Survey Service. Allows the Change to Cadastre service to be started::::Survey Service. Allows the Change to Cadastre service to be started::::Survey Service. Allows the Change to Cadastre service to be started::::Service Levé Cadastral. Permet au Service - Modification du Cadastre de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('newApartment', 'Service - New Apartment Title::::Service - New Apartment Title::::الخدمة-سند ملكية شقة جديد::::Service - Titre Nouvel Appartement', 'c', 'Registration Service. Allows the New Apartment Title service to be started. ::::Registration Service. Allows the New Apartment Title service to be started.::::Registration Service. Allows the New Apartment Title service to be started.::::Service Enregistrement. Permet au Service - Titre Nouvel Appartement de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('regnStandardDocument', 'Service - Registration of Standard Document::::Service - Registration of Standard Document::::الخدمة-تسجيل وثيقة معيارية::::Service - Enregistrement de Document Standard', 'c', 'Registration Service. Allows the Register of Standard Document service to be started. ::::Registration Service. Allows the Register of Standard Document service to be started.::::Registration Service. Allows the Register of Standard Document service to be started.::::Service Enregistrement. Permet au Service - Enregistrement de Document Standard de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnArchive', 'Appln Action - Archive::::Appln Action - Archive::::جركة طلب - أرشفة::::Action Demande - Archiver', 'c', 'Required to perform the Archive applicaiton action. The Archive action transitions the application into the Completed state.  ::::Required to perform the Archive applicaiton action. The Archive action transitions the application into the Completed state.::::Required to perform the Archive applicaiton action. The Archive action transitions the application into the Completed state.::::Requis pour pouvoir effectuer l''action d''archivage de la demande. L''action d''archivage transforme le statut de la demande en "Exécuté".');
INSERT INTO approle (code, display_value, status, description) VALUES ('removeRight', 'Service - Remove Right (General)::::Service - Remove Right (General)::::الخدمة- ازالة حق عام::::Service - Supprimer Droit (Général)', 'c', 'Registration Service. Allows the Remove Right (General) service to be started. ::::Registration Service. Allows the Remove Right (General) service to be started.::::Registration Service. Allows the Remove Right (General) service to be started.::::Service Enregistrement. Permet au Service - Supprimer Droit (Général) de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ChangePassword', 'Admin - Change Password::::Admin - Change Password::::ادارة-تغيير كلمة المرور::::Admin - Changer le Mot de Passe', 'c', 'Allows a user to change their password and edit thier user name. This role should be included in every security group. ::::Allows a user to change their password and edit thier user name. This role should be included in every security group.::::Allows a user to change their password and edit thier user name. This role should be included in every security group.::::Permet à l''utilisateur de changer son mot de passe et d''éditer son nom d''utilisateur. Ce rôle doit être inclus dans tous les groupes de sécurité.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ManageRefdata', 'Admin - Reference Data::::Admin - Reference Data::::ادارة-البيانات المرجعية::::Admin - Données de Référence', 'c', 'Allows system administrators to manage (edit and save) reference data details.  Users with this role will be able to login to the SOLA Admin application. ::::Allows system administrators to manage (edit and save) reference data details.  Users with this role will be able to login to the SOLA Admin application.::::Allows system administrators to manage (edit and save) reference data details.  Users with this role will be able to login to the SOLA Admin application.::::Permet à l''administrateur système de gérer (éditer et sauvegarder) les détails des données de référence. Les utilisateurs avec ce rôle peuvent se connecter à l''application SOLA Admin.');
INSERT INTO approle (code, display_value, status, description) VALUES ('StartService', 'Service Action - Start::::Service Action - Start::::حركة خدمة-ابدأ::::Action Service - Commencer', 'c', 'Allows any user to click the Start action. Note that the user must also have the appropraite Service role as well before they can successfully start the service. ::::Allows any user to click the Start action. Note that the user must also have the appropraite Service role as well before they can successfully start the service.::::Allows any user to click the Start action. Note that the user must also have the appropraite Service role as well before they can successfully start the service.::::Permet n''importe quel utilisateur de cliquer pour commencer l''action. Notez que l''utilisateur doit aussi avoir le rôle du service approprié avant de pouvoir commencer le service.');
INSERT INTO approle (code, display_value, status, description) VALUES ('mapExistingParcel', 'Map Existing Parcel::::Map Existing Parcel::::الخارطة- القطع الموجودة::::Plan Parcelle Existante', 'c', 'Allows to map existing parcel as described on existing title. ::::Allows to map existing parcel as described on existing title.::::Allows to map existing parcel as described on existing title.::::Permet de tracer le plan de la parcelle existante comme décrit sur le titre existant.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ObjectionCommentEdit', 'Workflow - Edit Objection Comment', 'c', 'Allows the user to edit or remove all Timeline comments on an Objection task.');
INSERT INTO approle (code, display_value, status, description) VALUES ('slNotify', 'Service - Manage Notifications', 'c', 'State Land Service. Allows the Manage Notifications service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('slValuation', 'Service - Manage Valuations', 'c', 'State Land Service. Allows the Manage Valuations service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('slNegotiate', 'Service - Manage Negotiations', 'c', 'State Land Service. Allows the Manage Negotiations service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('DashbrdViewAssign', 'Dashboard - View Assigned::::Dashboard - View Assigned::::لوحة المراقبة-مشاهدة الطلبات المعينة::::Accueil - Visulaiser Assignée', 'c', 'Allows the user to view applications assigned to them in the Dashboard. To hide the Dashboard from the user, remove both this role and the Dashboard - View Unassigned role. ::::Allows the user to view applications assigned to them in the Dashboard. To hide the Dashboard from the user, remove both this role and the Dashboard - View Unassigned role.::::Allows the user to view applications assigned to them in the Dashboard. To hide the Dashboard from the user, remove both this role and the Dashboard - View Unassigned role.::::Permet à l''utilisateur de visualiser routes les demandes assignées dans l''accueil. Pour cacher l''Accueil de l''utilisateur, supprimer ce rôle et le rôle Accueil - Visualiser non Assigné.');
INSERT INTO approle (code, display_value, status, description) VALUES ('cancelProperty', 'Service - Cancel Title::::Service - Cancel Title::::الخدمة-الغاء سند ملكية::::Service - Annuler Titre', 'c', 'Lease Service. Allows the Cancel Title to be started. ::::Lease Service. Allows the Cancel Title to be started.::::Lease Service. Allows the Cancel Title to be started.::::Service Enregistrement. Permet au Service - Annuler Titre de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('buildingRestriction', 'Service - Register Building Restriction::::Service - Register Building Restriction::::الخدمة-تسجيل قيد بناء::::Service - Enregistrement Restriction de Construction', 'c', 'Registration Service. Allows the Register Building Restriction service to be started. ::::Registration Service. Allows the Register Building Restriction service to be started.::::Registration Service. Allows the Register Building Restriction service to be started.::::Service Enregistrement. Permet au Service - Enregistrement Restriction de Construction de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('limtedRoadAccess', 'Service - Register Limited Road Access::::Service - Register Limited Road Access::::الخدمة-تسجيل حق طريق محدود::::Service - Enregistrement d''un Accès Limité à la Route', 'c', 'Registration Service. Allows the Register Limited Road Access service to be started. ::::Registration Service. Allows the Register Limited Road Access service to be started.::::Registration Service. Allows the Register Limited Road Access service to be started.::::Service Enregistrement. Permet au Service - Enregistrement d''un Accès Limité à la Route de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('regnPowerOfAttorney', 'Service - Registration of Power of Attorney::::Service - Registration of Power of Attorney::::الخدمة-تسجيل وكالة::::Service - Enregistrement de Procuration', 'c', 'Registration Service. Allows the Registration of Power of Attorney service to be started. ::::Registration Service. Allows the Registration of Power of Attorney service to be started.::::Registration Service. Allows the Registration of Power of Attorney service to be started.::::Service Enregistrement. Permet au Service - Enregistrement de Procuration de commencer.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnApprove', 'Appln Action - Approval::::Appln Action - Approval::::حركة طلب - الموافقة::::Action Demande - Approuver', 'c', 'Required to perform the Approve applicaiton action. The Approve action transitions the application into the Approved state. 
All services on the application must be completed before this action is available. ::::Required to perform the Approve applicaiton action. The Approve action transitions the application into the Approved state.
All services on the application must be completed before this action is available.::::Required to perform the Approve applicaiton action. The Approve action transitions the application into the Approved state.
All services on the application must be completed before this action is available.::::Requis pour pouvoir effectuer l''action d''approbation de la demande. L''action d''approbation transforme le statut de la demande en "Approuvé". Tous les services de l''application doivent être exécuté avant que cette action soit possible.');
INSERT INTO approle (code, display_value, status, description) VALUES ('consolidationExt', 'Admin - Consolidation Extract::::Admin - Consolidation Extract::::Admin - Consolidation Extract::::Admin - Consolidation Extract', 'c', 'Allows system administrators to start the extraction or records for consolidating in another system.::::Allows system administrators to start the extraction or records for consolidating in another system.::::Allows system administrators to start the extraction or records for consolidating in another system.::::Allows system administrators to start the extraction or records for consolidating in another system.');
INSERT INTO approle (code, display_value, status, description) VALUES ('consolidationCons', 'Admin - Consolidation Consolidate::::Admin - Consolidation Consolidate::::Admin - Consolidation Consolidate::::Admin - Consolidation Consolidate', 'c', 'Allows system administrators to consolidate records coming from another system.::::Allows system administrators to start the extraction or records for consolidating in another system.::::Allows system administrators to start the extraction or records for consolidating in another system.::::Allows system administrators to start the extraction or records for consolidating in another system.');
INSERT INTO approle (code, display_value, status, description) VALUES ('AccessCS', 'Access Community Server', 'c', 'Allows to access Community Server as Community recorder user');
INSERT INTO approle (code, display_value, status, description) VALUES ('ModerateClaim', 'Moderate claim', 'c', 'Allows to moderate claims submitted by other community recorders.');
INSERT INTO approle (code, display_value, status, description) VALUES ('BaUnitNotes', 'Property - Add & Edit Notes', 'c', 'Allows property notes to be added or edited.');
INSERT INTO approle (code, display_value, status, description) VALUES ('recordStateLand', 'Service - Record State Land', 'c', 'State Land Service. Allows the Record State Land service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('MeasureMap', 'Map - Measure', 'c', 'Allows the user to measure distances on the map using the Measure tool.');
INSERT INTO approle (code, display_value, status, description) VALUES ('BaunitTeam', 'Property - Assign Team', 'c', 'Allows the user to assign a team (e.g. Property Manager) to a property.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ChangeSecClass', 'Security - Change Security Classification', 'c', 'Allows the user to set or change the security classification for a record.');
INSERT INTO approle (code, display_value, status, description) VALUES ('01SEC_Unrestricted', 'Security - Unrestricted', 'c', 'Grants user clearance to view and/or access all unrestricted records.');
INSERT INTO approle (code, display_value, status, description) VALUES ('02SEC_Restricted', 'Security - Restricted', 'c', 'Grants user clearance to view and/or access all unrestricted and restricted records.');
INSERT INTO approle (code, display_value, status, description) VALUES ('03SEC_Confidential', 'Security - Confidential', 'c', 'Grants user clearance to view and/or access all unrestricted, restricted and confidential records.');
INSERT INTO approle (code, display_value, status, description) VALUES ('04SEC_Secret', 'Security - Secret', 'c', 'Grants user clearance to view and/or access all unrestricted, restricted, confidential and secret records.');
INSERT INTO approle (code, display_value, status, description) VALUES ('05SEC_TopSecret', 'Security - Top Secret', 'c', 'Grants user clearance to view and/or access all records.');
INSERT INTO approle (code, display_value, status, description) VALUES ('10SEC_SuppressOrd', 'Security - Suppression Order', 'c', 'Grants user clearance to view and/or access all records marked with the Supression Order security classification.');
INSERT INTO approle (code, display_value, status, description) VALUES ('changeSLParcels', 'Service - Change State Land Parcels', 'c', 'State Land Service. Allows the Change State Land Parcels service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('maintainStateLand', 'Service - Maintain State Land', 'c', 'State Land Service. Allows the Maintain State Land service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('cancelInterest', 'Service - Cancel State Land Interest', 'c', 'State Land Service. Allows the Cancel State Land Interest service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('checklist', 'Service - Checklist', 'c', 'State Land Service. Allows the Checklist service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('disposeSLProperty', 'Service - Dispose Property', 'c', 'State Land Service. Allows the Dispose Property service to be started.');


ALTER TABLE approle ENABLE TRIGGER ALL;

--
-- Data for Name: br_severity_type; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE br_severity_type DISABLE TRIGGER ALL;

INSERT INTO br_severity_type (code, display_value, status, description) VALUES ('critical', 'Critical::::Критичное::::حرج::::Critique', 'c', '...::::::::...::::...');
INSERT INTO br_severity_type (code, display_value, status, description) VALUES ('medium', 'Medium::::Среднее::::متوسط::::Moyen', 'c', '...::::::::...::::...');
INSERT INTO br_severity_type (code, display_value, status, description) VALUES ('warning', 'Warning::::Предупреждение::::تحذير::::Alerte', 'c', '...::::::::...::::...');


ALTER TABLE br_severity_type ENABLE TRIGGER ALL;

--
-- Data for Name: br_technical_type; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE br_technical_type DISABLE TRIGGER ALL;

INSERT INTO br_technical_type (code, display_value, status, description) VALUES ('drools', 'Drools::::Drools::::Drools::::Drools', 'c', 'The rule definition is based on Drools engine.::::The rule definition is based on Drools engine.::::...::::La définition de la règle est basée sur le moteur Drools.');
INSERT INTO br_technical_type (code, display_value, status, description) VALUES ('sql', 'SQL::::SQL::::SQL::::SQL', 'c', 'The rule definition is based in sql and it is executed by the database engine.::::The rule definition is based in sql and it is executed by the database engine.::::...::::La définition de la règle est basée en SQL et est exécutée par le moteur de la base de donnée.');


ALTER TABLE br_technical_type ENABLE TRIGGER ALL;

--
-- Data for Name: br_validation_target_type; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE br_validation_target_type DISABLE TRIGGER ALL;

INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('bulkOperationSpatial', 'BUlk operation::::Массовая Операция::::رزمة عمليات::::Opération en masse', 'c', 'The target of the validation is the transaction related with the bulk operations.::::Объектом проверки является транзакция, отосящаяся к массовым операциям.::::...::::La cible de la validation est la transaction liée à l''opération en masse.');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('service', 'Service::::Услуга::::خدمة::::Service', 'c', 'The target of the validation is the service. It accepts one parameter {id} which is the service id.::::Объектом проверки является услуга. Имеется один входной параметр - {id} который является id услуги.::::...::::La cible de la validation est le service. Elle accepte un paramètre {id} qui est le numéro d''identification du service.');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('ba_unit', 'Administrative Unit::::Единица Недвижимости::::وحدة ادارية::::Unité Administrative', 'c', 'The target of the validation is the ba_unit. It accepts one parameter {id} which is the ba_unit id.::::Объектом проверки является единица недвижимости. Имеется один входной параметр - {id} который является id недвижимости.::::...::::La cible de la validation est la ba_unit, l''unité adminstrative de base. Elle accepte un paramètre {id} qui est le numéro d''identification de l''unité administrative ba_unit id.');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('source', 'Source::::Документ::::المصدر::::Source', 'c', 'The target of the validation is the source. It accepts one parameter {id} which is the source id.::::Объектом проверки является документ. Имеется один входной параметр - {id} который является id документа.::::...::::La cible de la validation est la source. Elle accepte un paramètre {id} qui est le numéro d''identification de la source.');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('application', 'Application::::Заявление::::الطلب::::Demande', 'c', 'The target of the validation is the application. It accepts one parameter {id} which is the application id.::::Объектом проверки является заявление. Имеется один входной параметр - {id} который является id заявления.::::...::::LA cible de la validation est la demande. Elle accepte un paramètre {id} qui est le numéro d''identification de la demande.');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('cadastre_object', 'Cadastre Object::::Кадастровый Объект::::كائن مساحة::::Objet Cadastre', 'c', 'The target of the validation is the transaction related with the cadastre change. It accepts one parameter {id} which is the transaction id.::::Объектом проверки является кадастровый объект. Имеется один входной параметр - {id} который является id транзакции.::::هدف التحقق من صحة الحركة فحص التغيير على الكائن الممسوح::::La cible de la validation est la transaction liée à la modification du cadastre. Elle accepte un paramètre {id} qui est le numéro d''identification de la transaction.');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('public_display', 'Public display::::Публичный показ::::أظهار عام::::Affichage Public', 'c', 'The target of the validation is the set of cadastre objects/ba units that belong to a certain last part. It accepts one parameter {lastPart} which is the last part.::::Объектом проверки является комбинация кадастрового объекта и ед. недвижимости содержащих одинакокую последнюю часть идентификационного кода. Имеется один входной параметр - {lastPart} который является последней частью идентификационного кода.::::...::::La cible de la validation est le lot d''objets cadastre / d''unités administratives qui appartiennent à une certaine dernière partie. Elle accepte un paramètre {lastpart} qui est la dernière partie.');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('rrr', 'Right or Restriction::::Право или Ограничение::::حق أو قيد::::Droit ou Restriction', 'c', 'The target of the validation is the rrr. It accepts one parameter {id} which is the rrr id. ::::Объектом проверки является право. Имеется один входной параметр - {id} который является id права.::::...::::La cible de la validation est le RRR. Elle accepte un paramètre {id} qui est le numéro d''identification du RRR.');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('spatial_unit_group', 'Spatial unit group::::Пространственная группа::::مجموعة الوحدات المكانية::::Groupe d''Unité Spatiale', 'c', 'The target of the validation are the spatial unit groups::::Объектом проверки является пространственные группы::::...::::La cible de la validation sont les groupes d''unité spatiale');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('consolidation', 'Consolidation::::Consolidation::::Consolidation::::Consolidation', 'c', 'The target of the validation are the records to be consolidated::::The target of the validation are the records to be consolidated::::...::::The target of the validation are the records to be consolidated');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('state_land', 'State Land Parcel', 'c', 'Identifies business rules to execute when creating or changing State Land Parcels. These rules accept the transaction id as a parameter.');


ALTER TABLE br_validation_target_type ENABLE TRIGGER ALL;

--
-- Data for Name: language; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE language DISABLE TRIGGER ALL;

INSERT INTO language (code, display_value, active, is_default, item_order) VALUES ('en-US', 'English::::Английский::::أنجليزي::::Anglais', true, true, 1);
INSERT INTO language (code, display_value, active, is_default, item_order) VALUES ('fr-FR', 'French::::Французкий::::فرنسي::::Français', true, false, 4);
INSERT INTO language (code, display_value, active, is_default, item_order) VALUES ('ar-JO', 'Arabic::::Арабский::::عربي::::Arabe', true, false, 3);
INSERT INTO language (code, display_value, active, is_default, item_order) VALUES ('ru-RU', 'Russian::::Русский::::الروسية::::Russe', true, false, 2);


ALTER TABLE language ENABLE TRIGGER ALL;

SET search_path = transaction, pg_catalog;

--
-- Data for Name: reg_status_type; Type: TABLE DATA; Schema: transaction; Owner: postgres
--

ALTER TABLE reg_status_type DISABLE TRIGGER ALL;

INSERT INTO reg_status_type (code, display_value, description, status) VALUES ('historic', 'Historic::::История::::تاريخي::::Historique', '...::::::::...::::...', 'c');
INSERT INTO reg_status_type (code, display_value, description, status) VALUES ('pending', 'Pending::::На исполнении::::قيد الانتظار::::En attente', '...::::::::...::::...', 'c');
INSERT INTO reg_status_type (code, display_value, description, status) VALUES ('previous', 'Previous::::Предыдущий::::السابق::::Précédent', '...::::::::...::::...', 'c');
INSERT INTO reg_status_type (code, display_value, description, status) VALUES ('current', 'Current::::Текущий::::الحالي::::Courant', '...::::::::...::::...', 'c');


ALTER TABLE reg_status_type ENABLE TRIGGER ALL;

--
-- Data for Name: transaction_status_type; Type: TABLE DATA; Schema: transaction; Owner: postgres
--

ALTER TABLE transaction_status_type DISABLE TRIGGER ALL;

INSERT INTO transaction_status_type (code, display_value, description, status) VALUES ('approved', 'Approved::::Одобрено::::موافق عليه::::Approuvé', '', 'c');
INSERT INTO transaction_status_type (code, display_value, description, status) VALUES ('cancelled', 'Cancelled::::Отменено::::ملغى::::Annulé', '', 'c');
INSERT INTO transaction_status_type (code, display_value, description, status) VALUES ('pending', 'Pending::::Незавершено::::معلق::::En attente', '', 'c');
INSERT INTO transaction_status_type (code, display_value, description, status) VALUES ('completed', 'Completed::::Завершено::::مكتمل::::Exécuté', '', 'c');


ALTER TABLE transaction_status_type ENABLE TRIGGER ALL;

--
-- PostgreSQL database dump complete
--

