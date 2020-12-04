function Part1($lines) {
    $valid = 0
    foreach ($line in $lines) {
        $fields = $line.Split(' ')
        $minMax = $fields[0].Split('-')
        $charCount = ($fields[2].ToCharArray() | Where-Object {$_ -eq $fields[1][0]} | Measure-Object).Count
        if($charCount -ge $minMax[0] -and $charCount -le $minMax[1]) {
            $valid++
        }
    }
    return $valid
}
function Part2($lines) {
    $valid = 0
    foreach ($line in $lines) {
        $fields = $line.Split(' ')
        $pos12 = $fields[0].Split('-')
        $password = $fields[2]
        $hit = $password[($pos12[0] -as [int]) -1] -eq $fields[1][0]
        $hit += $password[($pos12[1] -as [int]) -1] -eq $fields[1][0]
        if($hit -eq 1) {
            $valid++
        }
    }
    return $valid
}
$lines = ([IO.File]::ReadAllLines("C:\Dev\Advent2020\Day2Input.txt"))
$result1 = Part1 $lines
$result2 = Part2 $lines
Write-Host $result1 $result2