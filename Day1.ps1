function Part1($lines) {
    for($i = 0; $i -lt $lines.Count; $i++)
    {
        $x = $lines[$i] -as [int]
        for($j = $i + 1; $j -lt $lines.Count; $j++)
        {
            $y = $lines[$j] -as [int]
            if ($x + $y -eq 2020)
            {
                return $x * $y;
            }
        }
    }
}
function Part2($lines) {
    for($i = 0; $i -lt $lines.Count; $i++)
    {
        $x = $lines[$i] -as [int]
        for($j = $i + 1; $j -lt $lines.Count; $j++)
        {
            $y = $lines[$j] -as [int]
            for($k = $j + 1; $k -lt $lines.Count; $k++)
            {
                $z = $lines[$k] -as [int]
                if ($x + $y + $z -eq 2020)
                {
                    return $x * $y * $z
                }
            }
        }
    }
}
$lines = ([IO.File]::ReadAllLines("C:\Dev\Advent2020\Day1Input.txt"))
$result1 = Part1 $lines
$result2 = Part2 $lines
Write-Host $result1 $result2