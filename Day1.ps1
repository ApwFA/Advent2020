function Part1 {
    $lines = ([IO.File]::ReadAllLines("C:\Temp\day1.txt"))
    for($i = 0; $i -lt $lines.Count; $i++)
    {
        $x = $lines[$i] -as [int]
        for($j = $i + 1; $j -lt $lines.Count; $j++)
        {
            $y = $lines[$j] -as [int]
            if ($x + $y -eq 2020)
            {
                $result = $x * $y
                Write-Host $result
                break;
            }
        }
    }
}
function Part2 {
    $lines = ([IO.File]::ReadAllLines("C:\Temp\day1.txt"))
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
                    $result = $x * $y * $z
                    Write-Host $result
                    break;
                }
            }
        }
    }
}
Part1
Part2