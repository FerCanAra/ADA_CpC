--  Configuration for p2_cpc_2025 generated by Alire
pragma Restrictions (No_Elaboration_Code);
pragma Style_Checks (Off);

package P2_Cpc_2025_Config is
   pragma Pure;

   Crate_Version : constant String := "0.1.0-dev";
   Crate_Name : constant String := "p2_cpc_2025";

   Alire_Host_OS : constant String := "windows";

   Alire_Host_Arch : constant String := "x86_64";

   Alire_Host_Distro : constant String := "distribution_unknown";

   type Build_Profile_Kind is (release, validation, development);
   Build_Profile : constant Build_Profile_Kind := development;

end P2_Cpc_2025_Config;
