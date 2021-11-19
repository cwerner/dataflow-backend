# General Design and Concepts

This document is intended for the collection of gernal concepts ideas and design decisions. Basically a scratchpad for the stages to be developed.

## Stages

The dataflow pipeline will have two general data ingestion stages and one final output stage that merely converts and aggregates the data after QC. This document only deals with the autoamatic and manual QC stages.

### Automatic Checks

After data is received at `rawdata` automated quality control stages are triggered. They are ordered by their trigger sensitivity and thus also get more and more data specific (i.e. lvl1 stage only checks for general data validity/ range checks, while lvl2 stage checks for sensed variable specific anomaly pattern like spikes or flat-line events). 

#### Level 1 Expectations 
... basic range checks, NODATA checks etc.

#### Level 2a Expectationn 
... spike detection, other short-term anomaly detections.

#### Level 2b Expectations (optional)
... trend-following checks, possible assisted by active learning appraoches. 


### Manual Checks

This stage is performed with use4r intervention and using a GUI. Auto-checked data is pre-flagged and presented to the investigator and he/ she can asses, confirm or overwrite the auto-flagging outcome. Once signed off by the user the data is marked as approved and valid data is given clearance to be fed into lvl3 data products.

