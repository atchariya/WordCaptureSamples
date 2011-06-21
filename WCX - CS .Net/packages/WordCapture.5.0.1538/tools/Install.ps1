param($installPath, $toolsPath, $package, $project)

foreach($topProjectItem in $project.ProjectItems)
{
    if($topProjectItem.Name.Equals("WordCaptureSDK"))
    {
        foreach($projItem in $topProjectItem.ProjectItems)
        {
            if($projItem.Name -ne "Demo.exe")
            {
                foreach($prop in $projItem.Properties)
                {
                    if($prop.Name.Equals("CopyToOutputDirectory"))
                    {
                        $prop.Value = 1;
                    }
                }
            }
        }
    }
}