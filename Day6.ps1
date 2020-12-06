function Part1($text) {
    $groupCount = 0
    foreach($group in $text.Split("`n`n")) {
        $answers = @{}
        $group.Replace("`n", "").ToCharArray() | ForEach-Object { $answers[$_]++ }
        $groupCount += $answers.Count
    }
    return $groupCount
}
function Part2($text) {
    $groupCount = 0
    foreach($group in $text.Split("`n`n")) {
        $answerCounts = @{}
        $people = $group.Split("`n")
        foreach($personAnswers in $people) {
            $personAnswers.ToCharArray() | ForEach-Object { $answerCounts[$_]++ }
        }
        $groupCount += $answerCounts.GetEnumerator().Where({$_.Value -eq $people.Count}).Count
    }
    return $groupCount
}
$text = ([IO.File]::ReadAllText("C:\Dev\Advent2020\Day6Input.txt"))
Write-Host (Part1 $text) (Part2 $text)