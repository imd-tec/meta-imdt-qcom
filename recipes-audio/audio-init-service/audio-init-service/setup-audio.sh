#!/bin/sh

# Enable MI2S DAC for Playback 
qtitinymix "Left DAC Mux" DAC_L2
qtitinymix "Right DAC Mux" DAC_R2
qtitinymix "HP Playback Volume" 9 9

# Enable DMIC4 for Record 
qtitinymix 'TX DEC0 MUX' 'MSM_DMIC'
qtitinymix 'TX DMIC MUX0' 'DMIC4'
qtitinymix 'TX_AIF1_CAP Mixer DEC0' 1
qtitinymix 'TX_DEC0 Volume' 84
