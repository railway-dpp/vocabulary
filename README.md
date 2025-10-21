# Credential Vocabulary
# 5. Data Model

```mermaid
classDiagram

    class ProductGroup {
        <<DataElementCollection>>
        id
        economicOperatorId [legalPersonID]
        versionsOfStandards  
        railProfile
        steelGrade
        length
        weight
    }

    class DPP {
        <<GeneralHeader>>
        id
        productId
        productGroupId
        name
        granularity
        versionOfTheDppSchema
        economicOperatorId [legalPersonID]
        facilityId
    }
        
    class DoPC {
        <<credentialSubject>>
        id
        economicOperatorId [legalPersonID]
        productGroupId
        epdId
    
    }
    
    class EPD {
        <<credentialSubject>>
        id
        productGroupID
        economicOperatorId [legalPersonID]
        globalWarmingPotentialProduction
    }
    
    class Transport {
        <<credentialSubject>>
        id
        transportBatchId
        locationDeparture
        locationArriva
        serviceProviderId [legalPersonID] 
        globalWarmingPotentialTransport 
    }

    class TransportBatch {
        <<credentialSubject>>
        transportBatchId
        economicOperatorId [legalPersonID]
        locationDeparture
        locationArrival
        dppId      
    }
    
    class LegalPerson {
        <<credentialSubject>>
        id
        legalName
        legalIdentifier
        legalFormType
        registeredAddress
        registrationDate
        legalEntityStatus
        legalRepresentativeId [naturalPersonId]
        legalEntityActivity
        contactPoint
    }

    class NaturalPerson {
        <<credentialSubject>>
        id
        givenName
        familyName
        gender
        birthDate
        domicile		
    }
    
    class PowerOfAttorney {
       <<credentialSubject>>
       delegatee
       proxiedPermissions
    }

    class EU-DPPRegistry {
        <<registry>>
        dppId [Unique Identifier of the DPP instance]
    }

    class DppSchema {
        <<dictonary>>
        dppSchemaId
        version
        templateName
        
    }
    
    class EU_CompanyRegister {
        <<registry>>
        economicOperatorId [legalPersonID]
    }

    DPP "0..n" --* "1" ProductGroup
    ProductGroup "1..n" --o "0..1" EPD
    ProductGroup "1..n" --o "0..1" DoPC
    LegalPerson "1" *-- "0..n" ProductGroup
    DPP "0..n" -- "1" LegalPerson
    DPP "0..n" -- "0..1" EU-DPPRegistry
    LegalPerson "1" *-- "0..n" NaturalPerson : represents
    PowerOfAttorney "0..n" --* "1" NaturalPerson
    DoPC "0..n" --* "1" LegalPerson
    EPD "0..n" --* "1" LegalPerson
    Transport "0..n" --* "1" TransportBatch
    DPP "1..n" --o "0..n" TransportBatch
    DppSchema "1" -- "0..n" DPP
    EU_CompanyRegister "1" -- "0..n" LegalPerson
```

# Description data model
This chapter contains describtion of the classes visualized in the diagramm

## Natural Person
A trustworthy issuer E.g. country authority issues an eID to a natural person with attributes described in https://oid.spherity.com/eucc#NaturalPerson according EU Directive 25/2025 https://eur-lex.europa.eu/eli/dir/2025/25/oj/eng/pdf


## Legal Person
A trustworthy issuer E.g. country authority issues an eID (LPID) to a legal person with attributes described in https://oid.spherity.com/eucc#LegalPerson according EU Directive 25/2025 https://eur-lex.europa.eu/eli/dir/2025/25/oj/eng/pdf
A LPID will be issued to a natural person registered as procurist in the commercial registry.

## Power of Attorney
Natural Person with LPID can issue company internally Power of Attorney to employees. Details described in https://oid.spherity.com/poa

## EU Company Registry
Company can be discovered via BRIS Business Register Interconected System https://e-justice.europa.eu/topics/registers-business-insolvency-land/business-registers-search-company-eu_en

## Product Group

## DoPC (Decleration of Product Confirmity)

## EPD (Environmental Product Decleration)

## DPP Schema

## DPP (Digital Product Passport)
class DPP (DigitalProductPassport) is the main entity and represents container for all relevant DPP data. 
dppId: Unique identifier of a Digital Product Passport e.g. URI "uri://www.voestalpine.com/dpp/111.."
productId: Identifies Product e.g. "gtin:111.."
name: e.g. "dppRailUno" 
granularity: Describes production level <model;batch;item>
versionOfTheDppSchema: Describes what schema in what version was used to issue DPP [public, standard]
economicOperatorId: legalPersonId or alternitivly VAT e.g. "vat:ATU14187100"
facilityId: Place of production e.g. GLN number "gln:9110015801378"

## EU-DPP Registry

## TransportBatch

## Transport
DB Cargo needs data to provide transporte service as discribed in class "Transport". Via idProductPassport and via Product Model following data will be provided: 
-  productWeight (via idProductPassport, via idProductModel)
-  productLenght (via idProductPassport, via IdProductModel)
-  Items
Items describes the number of rails that have to be transported.





## DPP Digital Product Passport

### Product ID
unique product identifier means a unique string of characters for the identification of a product that also enables a web link to the digital product passport.

According ESPR Art.2 (30): https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32024R1781&qid=1719580391746
| Key            | Value|
|----------------|------|
| Term           |productID|
| URL            |https://github.com/railway-dpp/vocabulary/edit/main/README.md#product-id|
| Expected Value ||

### DPP ID

| Key            | Value|
|----------------|------|
| Term           |dppID|
| URL            |https://github.com/railway-dpp/vocabulary/edit/main/README.md#dpp-id|
| Expected Value ||

### Granulartiy
| Key            | Value|
|----------------|------|
| Term           |granularity|
| URL            |https://github.com/railway-dpp/vocabulary/edit/main/README.md#granulartiy|
| Expected Value ||

### Base DPP Schema Version
| Key            | Value|
|----------------|------|
| Term           |baseDppSchemaVersion|
| URL            |https://github.com/railway-dpp/vocabulary/edit/main/README.md#base-dpp-schema-version|
| Expected Value ||

### Sector Data Model Version
| Key            | Value|
|----------------|------|
| Term           |sectorDataModelVersion|
| URL            |https://github.com/railway-dpp/vocabulary/edit/main/README.md#sector-data-model-version|
| Expected Value ||

### Status of the DPP
| Key            | Value|
|----------------|------|
| Term           |statusOfTheDpp|
| URL            |https://github.com/railway-dpp/vocabulary/edit/main/README.md#status-of-the-dpp|
| Expected Value ||

### Last Update
| Key            | Value|
|----------------|------|
| Term           |lastUpdate|
| URL            |https://github.com/railway-dpp/vocabulary/edit/main/README.md#last-update|
| Expected Value ||

### Economic Operator ID

unique operator identifier’ means a unique string of characters for the identification of an actor involved in a product’s value chain

According ESPR Art.2 (31): https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32024R1781&qid=1719580391746

| Key            | Value|
|----------------|------|
| Term           |economicOperatorId|
| URL            |https://github.com/railway-dpp/vocabulary/edit/main/README.md#economic-operator-id|
| Expected Value ||

### Facility ID 
| Key            | Value|
|----------------|------|
| Term           |facilityId|
| URL            |https://github.com/railway-dpp/vocabulary/edit/main/README.md#facility-id|
| Expected Value ||


## Vignol railway rails 46kg/m and above 

### Rail Profil
| Key            | Value|
|----------------|------|
| Term           |railProfil|
| URL            |https://github.com/railway-dpp/vocabulary/edit/main/README.md#rail-profil|
| Expected Value ||

### Steel Grade
| Key            | Value|
|----------------|------|
| Term           |steelGrade|
| URL            |https://github.com/railway-dpp/vocabulary/edit/main/README.md#steel-grade|
| Expected Value ||

### Length
| Key            | Value|
|----------------|------|
| Term           |length|
| URL            |https://github.com/railway-dpp/vocabulary/edit/main/README.md#length|
| Expected Value ||

### Weight
| Key            | Value|
|----------------|------|
| Term           |weight|
| URL            |https://github.com/railway-dpp/vocabulary/edit/main/README.md#weight|
| Expected Value ||

## EPD Environmental Product Declaration

### EPD ID
| Key            | Value|
|----------------|------|
| Term           |epdID|
| URL            |https://github.com/railway-dpp/vocabulary/edit/main/README.md#epd-id|
| Expected Value ||

### Climate Change Effects - Total
| Key            | Value|
|----------------|------|
| Term           |climatChangeEffectTotal|
| URL            |https://github.com/railway-dpp/vocabulary/edit/main/README.md#epd-environmental-product-declaration|
| Expected Value ||


## DOPC Declaration of Product Conformity

### DOPC ID
| Key            | Value|
|----------------|------|
| Term           |dopcId|
| URL            |https://github.com/railway-dpp/vocabulary/edit/main/README.md#dopc-id|
| Expected Value ||


# AI - DPP Schiene Vocabulary (Classes and Properties from the Mermaid Data Model)

# DPP Rail Vocabulary (Classes and Properties from the Mermaid Data Model, revised with CEN DPP Interoperability)

Note: Only classes and properties defined in the provided Mermaid data model are listed. Where property descriptions are missing, authoritative context is taken from the CEN/CLC/JTC 24 DPP Interoperability draft for DPP-related semantics (CEN-CLC-JTC 24-WG 4_N911_DRAFT - Module 4 - JT024005_2025-02-28.pdf, 1; 8; 21; 28) and from EN 13674-1 for rail-specific fields (Schinene Norm EN 13674-1.pdf, 1; 19; 20; 27; 120).

## ProductGroup

### id
Unique identifier of the product group.
| Key | Value |
|-----|------|
| Term | id |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#id |
| Expected Value | string (UUID/URI) |

### economicOperatorId
Unique identifier of the economic operator (LegalPerson), as part of DPP data structures and stakeholders in DPP context (CEN-CLC-JTC 24-WG 4_N911_DRAFT - Module 4 - JT024005_2025-02-28.pdf, 21).
| Key | Value |
|-----|------|
| Term | economicOperatorId |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#economicOperatorId |
| Expected Value | string (e.g., LPID, VAT) |

### versionsOfStandards
Applied versions of relevant standards (e.g., EN 13674-1 for rail products; DPP interoperability as per CEN/CLC/JTC 24 framework) (CEN-CLC-JTC 24-WG 4_N911_DRAFT - Module 4 - JT024005_2025-02-28.pdf, 4).
| Key | Value |
|-----|------|
| Term | versionsOfStandards |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#versionsOfStandards |
| Expected Value | array of string (standard identifiers and versions) |

### railProfile
Standardized rail profile for Vignole rails ≥ 46 kg/m as specified by EN 13674-1 (Schinene Norm EN 13674-1.pdf, 1). Annex G notes additional profiles in the 2017 revision (Schinene Norm EN 13674-1.pdf, 120).
| Key | Value |
|-----|------|
| Term | railProfile |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#railProfile |
| Expected Value | string (e.g., “60E1”, “54E1”) |

### steelGrade
Steel grade of the rail; acceptance and mechanical properties are governed by EN 13674-1 (Schinene Norm EN 13674-1.pdf, 20; 27). The 2017 revision added grades R370CrHT and R400HT (Schinene Norm EN 13674-1.pdf, 120). Heat-treated grade hardness variation is controlled (Schinene Norm EN 13674-1.pdf, 19).
| Key | Value |
|-----|------|
| Term | steelGrade |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#steelGrade |
| Expected Value | string (e.g., R260, R350HT, R370CrHT, R400HT) |

### length
Technical length of the rail; provided as a technical attribute in DPP data dictionaries (example: Length with unit mm) (CEN-CLC-JTC 24-WG 4_N911_DRAFT - Module 4 - JT024005_2025-02-28.pdf, 28).
| Key | Value |
|-----|------|
| Term | length |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#length |
| Expected Value | number (mm or m) |

### weight
Total mass of the rail(s); derived from profile-specific mass-per-metre (per EN 13674-1 scope for rails ≥ 46 kg/m) (Schinene Norm EN 13674-1.pdf, 1).
| Key | Value |
|-----|------|
| Term | weight |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#weight |
| Expected Value | number (kg) |

## DPP

### id
Unique identifier of the Digital Product Passport instance; DPP sits within the CEN/CLC/JTC 24 interoperability framework (CEN-CLC-JTC 24-WG 4_N911_DRAFT - Module 4 - JT024005_2025-02-28.pdf, 1).
| Key | Value |
|-----|------|
| Term | id |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#id |
| Expected Value | string (URI) |

### productId
Unique product identifier (e.g., GTIN) for the product covered by the DPP.
| Key | Value |
|-----|------|
| Term | productId |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#productId |
| Expected Value | string (e.g., gtin:…) |

### productGroupId
Reference to the associated ProductGroup for the DPP.
| Key | Value |
|-----|------|
| Term | productGroupId |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#productGroupId |
| Expected Value | string (UUID/URI) |

### name
Human-readable name or label of the DPP instance.
| Key | Value |
|-----|------|
| Term | name |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#name |
| Expected Value | string |

### granularity
Granularity of the DPP’s scope (model, batch, item); addressed in semantic lifecycle staging (CEN-CLC-JTC 24-WG 4_N911_DRAFT - Module 4 - JT024005_2025-02-28.pdf, 8).
| Key | Value |
|-----|------|
| Term | granularity |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#granularity |
| Expected Value | enum (“model” | “batch” | “item”) |

### versionOfTheDppSchema
Version of the DPP schema used to issue the passport.
| Key | Value |
|-----|------|
| Term | versionOfTheDppSchema |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#versionOfTheDppSchema |
| Expected Value | string (e.g., “1.0.0”) |

### economicOperatorId
Identifier of the economic operator responsible for the DPP entry (stakeholder roles are defined in the DPP context) (CEN-CLC-JTC 24-WG 4_N911_DRAFT - Module 4 - JT024005_2025-02-28.pdf, 21).
| Key | Value |
|-----|------|
| Term | economicOperatorId |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#economicOperatorId |
| Expected Value | string |

### facilityId
Identifier of the production facility (e.g., GLN).
| Key | Value |
|-----|------|
| Term | facilityId |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#facilityId |
| Expected Value | string |

## DoPC

### id
Unique identifier of the Declaration of Product Conformity.
| Key | Value |
|-----|------|
| Term | id |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#id |
| Expected Value | string |

### economicOperatorId
Identifier of the issuing economic operator.
| Key | Value |
|-----|------|
| Term | economicOperatorId |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#economicOperatorId |
| Expected Value | string |

### productGroupId
Reference to the product group being declared conformant.
| Key | Value |
|-----|------|
| Term | productGroupId |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#productGroupId |
| Expected Value | string |

### epdId
Reference to the linked Environmental Product Declaration (EPD), if applicable.
| Key | Value |
|-----|------|
| Term | epdId |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#epdId |
| Expected Value | string |

## EPD

### id
Unique identifier of the Environmental Product Declaration.
| Key | Value |
|-----|------|
| Term | id |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#id |
| Expected Value | string |

### productGroupID
Reference to the ProductGroup covered by the EPD.
| Key | Value |
|-----|------|
| Term | productGroupID |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#productGroupID |
| Expected Value | string |

### economicOperatorId
Identifier of the economic operator responsible for the EPD.
| Key | Value |
|-----|------|
| Term | economicOperatorId |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#economicOperatorId |
| Expected Value | string |

### globalWarmingPotentialProduction
Global warming potential (CO₂e) for production phase as declared in EPD methodology.
| Key | Value |
|-----|------|
| Term | globalWarmingPotentialProduction |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#globalWarmingPotentialProduction |
| Expected Value | number (e.g., kg CO₂e per declared unit) |

## Transport

### id
Unique identifier of the transport record.
| Key | Value |
|-----|------|
| Term | id |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#id |
| Expected Value | string |

### transportBatchId
Reference to the TransportBatch (shipment batch).
| Key | Value |
|-----|------|
| Term | transportBatchId |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#transportBatchId |
| Expected Value | string |

### locationDeparture
Departure location (address or coordinates).
| Key | Value |
|-----|------|
| Term | locationDeparture |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#locationDeparture |
| Expected Value | string |

### locationArriva
Arrival location (note: property spelled “Arriva” in the model).
| Key | Value |
|-----|------|
| Term | locationArriva |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#locationArriva |
| Expected Value | string |

### serviceProviderId
Identifier of the transport service provider (LegalPerson). “Service provider” is defined as any natural or legal person providing an information service; DPP also defines a “digital product passport service provider” role (CEN-CLC-JTC 24-WG 4_N911_DRAFT - Module 4 - JT024005_2025-02-28.pdf, 21).
| Key | Value |
|-----|------|
| Term | serviceProviderId |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#serviceProviderId |
| Expected Value | string |

### globalWarmingPotentialTransport
Global warming potential (CO₂e) of transport.
| Key | Value |
|-----|------|
| Term | globalWarmingPotentialTransport |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#globalWarmingPotentialTransport |
| Expected Value | number (kg CO₂e) |

## TransportBatch

### transportBatchId
Unique identifier of the transport batch.
| Key | Value |
|-----|------|
| Term | transportBatchId |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#transportBatchId |
| Expected Value | string |

### economicOperatorId
Identifier of the responsible economic operator.
| Key | Value |
|-----|------|
| Term | economicOperatorId |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#economicOperatorId |
| Expected Value | string |

### locationDeparture
Departure location.
| Key | Value |
|-----|------|
| Term | locationDeparture |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#locationDeparture |
| Expected Value | string |

### locationArrival
Arrival location.
| Key | Value |
|-----|------|
| Term | locationArrival |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#locationArrival |
| Expected Value | string |

### dppId
Identifier of the associated DPP instance.
| Key | Value |
|-----|------|
| Term | dppId |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#dppId |
| Expected Value | string |

## LegalPerson

### id
Unique identifier of the legal person.
| Key | Value |
|-----|------|
| Term | id |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#id |
| Expected Value | string |

### legalName
Registered legal name.
| Key | Value |
|-----|------|
| Term | legalName |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#legalName |
| Expected Value | string |

### legalIdentifier
Official identifier (e.g., company register number, LPID).
| Key | Value |
|-----|------|
| Term | legalIdentifier |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#legalIdentifier |
| Expected Value | string |

### legalFormType
Legal form (e.g., AG, GmbH).
| Key | Value |
|-----|------|
| Term | legalFormType |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#legalFormType |
| Expected Value | string |

### registeredAddress
Registered address.
| Key | Value |
|-----|------|
| Term | registeredAddress |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#registeredAddress |
| Expected Value | string |

### registrationDate
Date of registration.
| Key | Value |
|-----|------|
| Term | registrationDate |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#registrationDate |
| Expected Value | string (YYYY-MM-DD) |

### legalEntityStatus
Status of the entity (e.g., active/inactive).
| Key | Value |
|-----|------|
| Term | legalEntityStatus |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#legalEntityStatus |
| Expected Value | string |

### legalRepresentativeId
Identifier of the legal representative (NaturalPerson).
| Key | Value |
|-----|------|
| Term | legalRepresentativeId |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#legalRepresentativeId |
| Expected Value | string |

### legalEntityActivity
Activity or sector description.
| Key | Value |
|-----|------|
| Term | legalEntityActivity |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#legalEntityActivity |
| Expected Value | string |

### contactPoint
Contact details (e.g., email, phone).
| Key | Value |
|-----|------|
| Term | contactPoint |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#contactPoint |
| Expected Value | string |

## NaturalPerson

### id
Unique identifier of the natural person.
| Key | Value |
|-----|------|
| Term | id |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#id |
| Expected Value | string |

### givenName
Given name.
| Key | Value |
|-----|------|
| Term | givenName |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#givenName |
| Expected Value | string |

### familyName
Family name.
| Key | Value |
|-----|------|
| Term | familyName |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#familyName |
| Expected Value | string |

### gender
Gender (if maintained).
| Key | Value |
|-----|------|
| Term | gender |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#gender |
| Expected Value | string |

### birthDate
Date of birth.
| Key | Value |
|-----|------|
| Term | birthDate |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#birthDate |
| Expected Value | string (YYYY-MM-DD) |

### domicile
Place of domicile.
| Key | Value |
|-----|------|
| Term | domicile |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#domicile |
| Expected Value | string |

## PowerOfAttorney

### delegatee
Delegatee (natural person receiving the power of attorney).
| Key | Value |
|-----|------|
| Term | delegatee |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#delegatee |
| Expected Value | string (naturalPersonId) |

### proxiedPermissions
Granted permissions.
| Key | Value |
|-----|------|
| Term | proxiedPermissions |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#proxiedPermissions |
| Expected Value | array of string |

## EU-DPPRegistry

### dppId
Unique identifier of the DPP instance registered.
| Key | Value |
|-----|------|
| Term | dppId |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#dppId |
| Expected Value | string (URI) |

## DppSchema

### dppSchemaId
Identifier of the DPP schema.
| Key | Value |
|-----|------|
| Term | dppSchemaId |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#dppSchemaId |
| Expected Value | string |

### version
Schema version.
| Key | Value |
|-----|------|
| Term | version |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#version |
| Expected Value | string |

### templateName
Template name.
| Key | Value |
|-----|------|
| Term | templateName |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#templateName |
| Expected Value | string |

## EU_CompanyRegister

### economicOperatorId
Identifier of the economic operator (LegalPerson), discoverable via EU company registers (contextual to DPP stakeholder identification, see stakeholder roles) (CEN-CLC-JTC 24-WG 4_N911_DRAFT - Module 4 - JT024005_2025-02-28.pdf, 21).
| Key | Value |
|-----|------|
| Term | economicOperatorId |
| URL | https://github.com/railway-dpp/vocabulary/edit/main/README.md#economicOperatorId |
| Expected Value | string |

References used in this vocabulary:
- EN 13674-1 scope and applicability to Vignole rails ≥ 46 kg/m (Schinene Norm EN 13674-1.pdf, 1)
- Heat-treated rail hardness variation requirement (Schinene Norm EN 13674-1.pdf, 19)
- Acceptance tests framework (Schinene Norm EN 13674-1.pdf, 20)
- Tensile testing method and sampling (Schinene Norm EN 13674-1.pdf, 27; 28)
- Significant technical changes: added rail profiles and grades (Schinene Norm EN 13674-1.pdf, 120)
- DPP system context and framework (CEN-CLC-JTC 24-WG 4_N911_DRAFT - Module 4 - JT024005_2025-02-28.pdf, 1)
- Semantic interoperability and lifecycle aspects underpinning granularity (CEN-CLC-JTC 24-WG 4_N911_DRAFT - Module 4 - JT024005_2025-02-28.pdf, 8)
- Stakeholder roles, service provider and DPP service provider definitions (CEN-CLC-JTC 24-WG 4_N911_DRAFT - Module 4 - JT024005_2025-02-28.pdf, 21)
- Data dictionary example showing Length attribute and unit (CEN-CLC-JTC 24-WG 4_N911_DRAFT - Module 4 - JT024005_2025-02-28.pdf, 28)







