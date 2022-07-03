function stand()
    local args = {
     [1] = "LearnSkill",
     [2] = {
         ["Skill"] = "Worthiness I",
         ["SkillTreeType"] = "Character"
     }
     
     
 }
 
 game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(args))
 
 local args = {
     [1] = "EndDialogue",
     [2] = {
         ["NPC"] = "Mysterious Arrow",
         ["Option"] = "Option1",
         ["Dialogue"] = "Dialogue2"
     }
 }
 
 game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))
 
 
 
  
 end
 
 function unstand()
    local args = {
     [1] = "EndDialogue",
     [2] = {
         ["NPC"] = "Rokakaka",
         ["Option"] = "Option1",
         ["Dialogue"] = "Dialogue2"
     }
 }
 
 game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))
  
 end
 
 game:GetService("UserInputService").InputBegan:Connect(function(key, ret)
    if ret then return end
    
    if key.KeyCode == Enum.KeyCode.K then
        stand()
    end
  if key.KeyCode == Enum.KeyCode.L then
        unstand()
     end
 end)