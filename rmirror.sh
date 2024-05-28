#!/bin/bash


	
rate-mirrors --entry-country GR --protocol=https arch | sudo tee /etc/pacman.d/mirrorlist-arch && rate-mirrors --entry-country GR --protocol=https chaotic-aur | sudo tee /etc/pacman.d/chaotic-mirrorlist

  
 
