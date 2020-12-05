function Part1($lines) {
    $highest = 0
    foreach($line in $lines) {
        $row =  [Convert]::ToInt32($line.Substring(0,7).Replace('F', '0').Replace('B', '1'), 2)
        $seat = [Convert]::ToInt32($line.Substring(7).Replace('L', '0').Replace('R', '1'), 2)
        $check = $row * 8 + $seat
        if($check -gt $highest) {
            $highest = $check
        }
    }
    return $highest
}
function Part2($lines) {
    $plane = New-Object 'object[,]' 128,8
    for($i = 0; $i -lt 128; $i++)
    {
        for($j = 0; $j -lt 8; $j++)
        {
            $plane[$i, $j] = "$($i * 8 + $j)"
        }
    } 
    foreach($line in $lines) {
        $row =  [Convert]::ToInt32($line.Substring(0,7).Replace('F', '0').Replace('B', '1'), 2)
        $seat = [Convert]::ToInt32($line.Substring(7).Replace('L', '0').Replace('R', '1'), 2)
        $plane[$row, $seat] = ""
    }
    return $plane.Where({$_ -ne ""})
}

$lines = ([IO.File]::ReadAllLines("C:\Dev\Advent2020\Day5Input.txt"))
$result1 = Part1 $lines
$result2 = Part2 $lines
Write-Host $result1 $result2