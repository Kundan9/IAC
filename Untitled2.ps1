configuration config1
    {
    Import-DscResource -ModuleName psdesiredstateconfiguration
    Node kundan-comp
        {
        service Bits_service
            {
                Name="BITS"
                State="Stopped"

            }

        }
}