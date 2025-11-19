Import-Module DFSR

# CHANGE THESE
$rgName         = "fqm.internal\expl\NAmercia"
$primaryMember  = "ZURSRVPFS03"
$otherMember    = "PERVWPRDPFS04"   # change to your partner server

$folders = @(
    @{ Name="Quebec_Dist"        ; Path="E:\EXPL\Spatial\PRJ\NAmerica\CANSuperior\Quebec_Dist"        }
    @{ Name="Alberta_Dist"       ; Path="E:\EXPL\Spatial\PRJ\NAmerica\CANWest\Alberta_Dist"           }
    @{ Name="BritishCol_Dist"    ; Path="E:\EXPL\Spatial\PRJ\NAmerica\CANWest\BritishCol_Dist"        }
    @{ Name="CANWestReg"         ; Path="E:\EXPL\Spatial\PRJ\NAmerica\CANWest\CANWestReg"             }
    @{ Name="NWTerri_Dist"       ; Path="E:\EXPL\Spatial\PRJ\NAmerica\CANWest\NWTerri_Dist"           }
    @{ Name="Saskatch_Dist"      ; Path="E:\EXPL\Spatial\PRJ\NAmerica\CANWest\Saskatch_Dist"          }
    @{ Name="Yukon_Dist"         ; Path="E:\EXPL\Spatial\PRJ\NAmerica\CANWest\Yukon_Dist"             }
    @{ Name="GreenlandReg"       ; Path="E:\EXPL\Spatial\PRJ\NAmerica\Greenland\GreenlandReg"         }
    @{ Name="GulfMexicoReg"      ; Path="E:\EXPL\Spatial\PRJ\NAmerica\GulfMexico\GulfMexicoReg"       }
    @{ Name="BajaCali_Dist"      ; Path="E:\EXPL\Spatial\PRJ\NAmerica\Mexico\BajaCali_Dist"           }
    @{ Name="MexicoReg"          ; Path="E:\EXPL\Spatial\PRJ\NAmerica\Mexico\MexicoReg"               }
    @{ Name="Oaxaca_Dist"        ; Path="E:\EXPL\Spatial\PRJ\NAmerica\Mexico\Oaxaca_Dist"             }
    @{ Name="SMadreOcc_Dist"     ; Path="E:\EXPL\Spatial\PRJ\NAmerica\Mexico\SMadreOcc_Dist"          }
    @{ Name="SMadreOri_Dist"     ; Path="E:\EXPL\Spatial\PRJ\NAmerica\Mexico\SMadreOri_Dist"          }
    @{ Name="SMadreSur_Dist"     ; Path="E:\EXPL\Spatial\PRJ\NAmerica\Mexico\SMadreSur_Dist"          }
    @{ Name="TransMex_Dist"      ; Path="E:\EXPL\Spatial\PRJ\NAmerica\Mexico\TransMex_Dist"           }
    @{ Name="AlaskanInt_Dist"    ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USAlaska\AlaskanInt_Dist"       }
    @{ Name="AlaskanPen_Dist"    ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USAlaska\AlaskanPen_Dist"       }
    @{ Name="AlaskanRa_Dist"     ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USAlaska\AlaskanRa_Dist"        }
    @{ Name="BrooksRa_Dist"      ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USAlaska\BrooksRa_Dist"         }
    @{ Name="USAlaskaReg"        ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USAlaska\USAlaskaReg"           }
    @{ Name="WranChugE_Dist"     ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USAlaska\WranChugE_Dist"        }
    @{ Name="WranChugW_Dist"     ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USAlaska\WranChugW_Dist"        }
    @{ Name="Illinois_Dist"      ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USMidWest\Illinois_Dist"        }
    @{ Name="Indiana_Dist"       ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USMidWest\Indiana_Dist"         }
    @{ Name="Iowa_Dist"          ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USMidWest\Iowa_Dist"            }
    @{ Name="Kansas_Dist"        ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USMidWest\Kansas_Dist"          }
    @{ Name="Michigan_Dist"      ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USMidWest\Michigan_Dist"        }
    @{ Name="Minnesota_Dist"     ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USMidWest\Minnesota_Dist"       }
    @{ Name="Missouri_Dist"      ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USMidWest\Missouri_Dist"        }
    @{ Name="Nebraska_Dist"      ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USMidWest\Nebraska_Dist"        }
    @{ Name="NthDakota_Dist"     ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USMidWest\NthDakota_Dist"       }
    @{ Name="Ohio_Dist"          ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USMidWest\Ohio_Dist"            }
    @{ Name="SthDakota_Dist"     ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USMidWest\SthDakota_Dist"       }
    @{ Name="USMidWestReg"       ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USMidWest\USMidWestReg"         }
    @{ Name="Wisconsin_Dist"     ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USMidWest\Wisconsin_Dist"       }
    @{ Name="Connecticut_Dist"   ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USNorthEast\Connecticut_Dist"   }
    @{ Name="Maine_Dist"         ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USNorthEast\Maine_Dist"         }
    @{ Name="Massachusetts_Dist" ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USNorthEast\Massachusetts_Dist" }
    @{ Name="NewHamp_Dist"       ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USNorthEast\NewHamp_Dist"       }
    @{ Name="NewJersey_Dist"     ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USNorthEast\NewJersey_Dist"     }
    @{ Name="NewYork_Dist"       ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USNorthEast\NewYork_Dist"       }
    @{ Name="Pennsylvania_Dist"  ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USNorthEast\Pennsylvania_Dist"  }
    @{ Name="RhodeIs_Dist"       ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USNorthEast\RhodeIs_Dist"       }
    @{ Name="USNorthEastReg"     ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USNorthEast\USNorthEastReg"     }
    @{ Name="Vermont_Dist"       ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USNorthEast\Vermont_Dist"       }
    @{ Name="Alabama_Dist"       ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USSouthEast\Alabama_Dist"       }
    @{ Name="Arkansas_Dist"      ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USSouthEast\Arkansas_Dist"      }
    @{ Name="Columbia_Dist"      ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USSouthEast\Columbia_Dist"      }
    @{ Name="Delaware_Dist"      ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USSouthEast\Delaware_Dist"      }
    @{ Name="Florida_Dist"       ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USSouthEast\Florida_Dist"       }
    @{ Name="Georgia_Dist"       ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USSouthEast\Georgia_Dist"       }
    @{ Name="Kentucky_Dist"      ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USSouthEast\Kentucky_Dist"      }
    @{ Name="Louisiana_Dist"     ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USSouthEast\Louisiana_Dist"     }
    @{ Name="Maryland_Dist"      ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USSouthEast\Maryland_Dist"      }
    @{ Name="Mississippi_Dist"   ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USSouthEast\Mississippi_Dist"   }
    @{ Name="NthCarolina_Dist"   ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USSouthEast\NthCarolina_Dist"   }
    @{ Name="Oklahoma_Dist"      ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USSouthEast\Oklahoma_Dist"      }
    @{ Name="SthCarolina_Dist"   ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USSouthEast\SthCarolina_Dist"   }
    @{ Name="Tennessee_Dist"     ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USSouthEast\Tennessee_Dist"     }
    @{ Name="Texas_Dist"         ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USSouthEast\Texas_Dist"         }
    @{ Name="USSouthEastReg"     ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USSouthEast\USSouthEastReg"     }
    @{ Name="Virginia_Dist"      ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USSouthEast\Virginia_Dist"      }
    @{ Name="WVirginia_Dist"     ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USSouthEast\WVirginia_Dist"     }
    @{ Name="Arizona_Dist"       ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USWest\Arizona_Dist"            }
    @{ Name="California_Dist"    ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USWest\California_Dist"         }
    @{ Name="Colorado_Dist"      ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USWest\Colorado_Dist"           }
    @{ Name="Idaho_Dist"         ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USWest\Idaho_Dist"              }
    @{ Name="Montana_Dist"       ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USWest\Montana_Dist"            }
    @{ Name="Nevada_Dist"        ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USWest\Nevada_Dist"             }
    @{ Name="NewMexico_Dist"     ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USWest\NewMexico_Dist"          }
    @{ Name="Oregon_Dist"        ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USWest\Oregon_Dist"             }
    @{ Name="USWestReg"          ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USWest\USWestReg"               }
    @{ Name="Utah_Dist"          ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USWest\Utah_Dist"               }
    @{ Name="Washington_Dist"    ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USWest\Washington_Dist"         }
    @{ Name="Wyoming_Dist"       ; Path="E:\EXPL\Spatial\PRJ\NAmerica\USWest\Wyoming_Dist"            }
)

foreach ($f in $folders) {
    $name = $f.Name
    $path = $f.Path

    if (-not (Get-DfsReplicatedFolder -GroupName $rgName -FolderName $name -ErrorAction SilentlyContinue)) {
        New-DfsReplicatedFolder -GroupName $rgName -FolderName $name | Out-Null
    }

    Set-DfsrMembership -GroupName $rgName -FolderName $name -ComputerName $primaryMember -ContentPath $path -PrimaryMember $true -StagingPathQuotaInMB 10240 -Confirm:$false
    Set-DfsrMembership -GroupName $rgName -FolderName $name -ComputerName $otherMember   -ContentPath $path -StagingPathQuotaInMB 10240 -Confirm:$false
}
