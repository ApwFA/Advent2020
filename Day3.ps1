function Part1($lines, $length, $xIncrement, $yIncrement) {
    $trees = 0
    for($i = 0; $i -lt $lines.Count; $i = $i + $yIncrement)
    {
        if($lines[$i][($i * $xIncrement) % $length] -eq '#') {
            $trees++
        }
    }
    return $trees
}
function Part2($lines, $length) {
    $total = Part1 $lines $length 1 1
    $total *= Part1 $lines $length 3 1
    $total *= Part1 $lines $length 5 1
    $total *= Part1 $lines $length 7 1
    $total *= Part1 $lines $length 1 2
    return $total
}
$lines = ([IO.File]::ReadAllLines("C:\Dev\Advent2020\Day3Input.txt"))
$length = $lines[0].Length
$result1 = Part1 $lines $length 3 1
$result2 = Part2 $lines $length
Write-Host $result1 $result2