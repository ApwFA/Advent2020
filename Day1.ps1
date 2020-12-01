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