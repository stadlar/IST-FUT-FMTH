---
title: "ÍST TS 313:2021"
author: ICS 03.060 and 35.240
date: "Entry into force 15-03-2021"
subject: "Icelandic Online Banking Webservices "
keywords: [IOBWS, ÍST, TS, 313]
subtitle: ["Tækniforskrift - Innlendar Erlendar greiðslur", "Technical Specification - Foreign payments"]
lang: "en"
titlepage: true,
# titlepage-rule-color: "360049"
titlepage-rule-height: 0
titlepage-background: "lib/istfrontpage.pdf"
toc: true
toc-title: Table of contents
# toc-own-page: true
book: true
classoption: oneside
numbersections: true
first-chapter: 1
listings-no-page-break: true
highlight: "zenburn"
codeBlockCaptions: True
mustache: "Vinnusvæði/Verkþáttur 5/313media/docvariables.yml"
figureTitle: |
  Figure #
lofTitle: |
  ## List of Figures
lotTitle: |
  ## List of Tables
tableTemplate: |
  *$$tableTitle$$ $$i$$*$$titleDelim$$ $$t$$
autoSectionLabels: True

...

!include-header "Vinnusvæði/Verkþáttur 5/310media/participants.yaml"

\newpage

!include "Vinnusvæði/Verkþáttur 5/310and313media/foreword.md"

# Introduction {.unnumbered}

This Technical Specification (TS) present version 3.0 of the Icelandic Online Banking Services (IOBWS), for {{context_short}}.

Previous versions of IOBWS, released in 2007 and 2013 respectively, defined common web service interfaces for the Icelandic commercial and savings banks. This enabled the integration of external accounting, payment, and information systems with the bank's services, to act on behalf of the customers and with full access to their data, e.g. for domestic accounts and payments. 

All the banks have offered comparable services for foreign payments and associated transaction but until the work on the IOBWS version 3.0 started, they had not been under scope for the common specifications. This time around it was decided by the TN-FMÞ that it was time to open up initiation of, and information on foreign payments in the form of access to account statements.

The participants in the TN-FMÞ reviewed existing and emerging specifications in the global or mostly European financial industry to look for ways to merge the various domestic schemas with a more widely adpoted framework.

!include`snippetStart="<!-- Start1 -->", snippetEnd="<!-- End1 -->"` "Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.md"

# Scope 


!include`snippetStart="<!-- ScopeDocContextStart -->", snippetEnd="<!-- ScopeDocContextEnd -->"` "Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.md"

!include`snippetStart="<!-- ScopePaymentsDocsContextStart -->", snippetEnd="<!-- ScopePaymentsDocsContextEnd -->"` "Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.md"


!include`snippetStart="<!-- ScopeEndNoteStart -->", snippetEnd="<!-- ScopeEndNoteEnd -->"` "Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.md"

# Normative references, definitions, and symbols 

!include "Vinnusvæði/Verkþáttur 5/310and313media/terminalogy.md"

\newpage

# Implementation

## Service Overview

!include`snippetStart="<!-- PaymentSvcOverviewStart -->", snippetEnd="<!-- PaymentSvcOverviewEnd -->"` "Vinnusvæði/Verkþáttur 5/ÍST TS 310_2020 Domestic payments and deposits.md"


## A.9. ISO Definitions

### A.9.1. ExternalServiceLevel1Code 

The following list contains suggested values.

  -----------------------------------------------------------------------
  Code              Name              Definition
  ----------------- ----------------- -----------------------------------
  SDVA              SameDayValue      Payment must be executed with same
                                      day value to the creditor.

  URGP              Urgent Payment    Payment must be executed as an
                                      urgent transaction cleared through
                                      a real-time gross settlement
                                      system, which is typically
                                      identified as a wire or high value
                                      transaction.
  -----------------------------------------------------------------------