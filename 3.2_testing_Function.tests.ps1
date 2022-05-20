# https://pester-docs.netlify.app/docs/commands/BeforeAll

BeforeAll {
    $thisPath = $PSScriptRoot

    #Load the function into memory
    . "$thisPath\3.1_testing_Function.ps1"

    $ipToTest = "111.112.113.114"
}

Describe "Get-Octet tests" {

    Context "Tests1" -Tag "noTestCases" {

        it "1st Octet is 111" {
            $result = Get-Octet -IP $ipToTest -Octet 1
            $result | Should -Be "111"
        }

        it "2nd Octet is 112" {
            $result = Get-Octet -IP $ipToTest -Octet 2
            $result | Should -Be "112"
        }

        it "3rd Octet is 112" {
            $result = Get-Octet -IP $ipToTest -Octet 3
            $result | Should -Be "113"
        }

        it "4th Octet is 112" {
            $result = Get-Octet -IP $ipToTest -Octet 4
            $result | Should -Be "114"
        }

    }

    Context "Tests2" -Tag "TestCases1" {

        it "Octet <octet> should be '<expected>'" -Foreach @(
            @{octet = 1; expected = 111}
            @{octet = 2; expected = 112}
            @{octet = 3; expected = 113}
            @{octet = 4; expected = 114}
        ){
            $result = Get-Octet -IP $ipToTest -Octet $octet
            $result | Should -Be $expected
        }

    }

    Context "Tests3" -Tag "TestCases2" {

        BeforeDiscovery {
            $testCases = @(
                @{octet = 1; expected = 111}
                @{octet = 2; expected = 112}
                @{octet = 3; expected = 113}
                @{octet = 4; expected = 114}
            )
        }

        it "Octet number <octet> should be '<expected>'" -Foreach $testCases {
            $result = Get-Octet -IP $ipToTest -Octet $octet
            $result | Should -Be $expected
        }

    }
}

Describe "Get-OctetBinary" -Tag "MocksExample" {

    # Mocking: https://pester-docs.netlify.app/docs/commands/Mock

    it "Octect value of 255 should be '11111111'" {
        Mock Get-Octet {return 255}

        $result = Get-OctetBinary -IP "000.000.000.000" -Octet 0
        $result | Should -Be "11111111"
    }

    it "Octect value of 111 should be '1101111'" {
        Mock Get-Octet {return 111}

        $result = Get-OctetBinary -IP "000.000.000.000" -Octet 0
        $result | Should -Be "1101111"
    }
}

