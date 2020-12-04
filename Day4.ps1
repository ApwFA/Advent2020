$requiredFields = @("byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid")
$eyeColours = @("amb", "blu", "brn", "gry", "grn", "hzl", "oth")
function Part1($lines) {
    $buffer = ""
    $validRecords = 0
    foreach($line in $lines) {
        if($line) {
            $buffer += " " + $line
        } else {
            if(RecordHasAllRequiredFields($buffer)) {
                $validRecords++
            }
            $buffer = ""
        }
    }
    return $validRecords
}
function Part2($lines) {
    $buffer = ""
    $validRecords = 0
    foreach($line in $lines) {
        if($line) {
            $buffer += " " + $line
        } else {
            $issue = RecordIncomplete($buffer)
            if($issue -eq "") {
                $validRecords++
            } else {
                Write-Host "$($issue.PadLeft(15)) : $buffer"
            }
            $buffer = ""
        }
    }
    return $validRecords
}

function RecordHasAllRequiredFields($buffer) {
    $fields = $buffer.Split(' ')
    $foundFields = 0
    foreach($field in $fields) {
        $fieldName = $field.Split(':')
        if($requiredFields.Contains($fieldName[0])) {
            $foundFields++
        }
    }
    return $foundFields -eq $requiredFields.Count
}

function RecordIncomplete($buffer) {
    $valid = 0
    foreach($field in $buffer.Split(' ')) {
        $fieldPair = $field.Split(':')
        $fieldName = $fieldPair[0]
        $fieldValue = $fieldPair[1]
        $year = $fieldValue -as [int];
        switch ($fieldName) {
            "byr" { if($year -lt 1920 -or $year -gt 2002) { return "byr" } else { $valid++ } break }
            "iyr" { if($year -lt 2010 -or $year -gt 2020) { return "iyr" } else { $valid++ } break }
            "eyr" { if($year -lt 2020 -or $year -gt 2030) { return "eyr" } else { $valid++ } break }
            "hgt" {
                $height = $fieldValue.Substring(0, $fieldValue.Length - 2) -as [int];
                if($fieldValue.EndsWith("cm")) {
                    if($height -lt 150 -or $height -gt 193) { return "hgt-cm" } else { $valid++ }
                } elseif($fieldValue.EndsWith("in")) {
                    if($height -lt 59 -or $height -gt 76) { return "hgt-in" } else { $valid++ }
                } else {
                    return "hgt-nounit"
                }
                break
            }
            "hcl" {
                if($fieldValue[0] -eq "#") {
                    if(!($fieldValue.Substring(1) -match "[0-9A-Fa-f]{6}")) { return "hcl-invalidhex" } else { $valid++ }
                } else {
                    return "hcl-nothex"
                }
                break
            }
            "ecl" { if(!$eyeColours.Contains($fieldValue)) { return "ecl" } else { $valid++ } break }
            "pid" { if($fieldValue.Length -ne 9 -or !$fieldValue -is [int]) { return "pid" } else { $valid++ } break }
        }
    }
    return $valid -eq $requiredFields.Count ? "" : "$($requiredFields.Count - $valid) MissingFields"
}

$lines = ([IO.File]::ReadAllLines("C:\Dev\Advent2020\Day4Input.txt"))
$result1 = Part1 $lines
$result2 = Part2 $lines
Write-Host $result1 $result2