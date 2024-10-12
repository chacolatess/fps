local M = {}

-- Function to execute FFmpeg commands
local function execute_command(command)
    local result = os.execute(command)
    return result
end

-- Create video montage
function M.create_montage(videos, background_music, output_video)
    local file_list = "file_list.txt"
    
    
    local file = io.open(file_list, "w")
    for _, video in ipairs(videos) do
        file:write("file '" .. video .. "'\n")
    end
    file:close()

  
    local concat_command = "ffmpeg -f concat -safe 0 -i " .. file_list .. " -c copy temp_video.mp4"
    execute_command(concat_command)

    
    local final_command = "ffmpeg -i temp_video.mp4 -i " .. background_music .. " -c:v copy -c:a aac -strict experimental -shortest " .. output_video
    execute_command(final_command)


    os.remove(file_list)
    os.remove("temp_video.mp4")

    print("Goodbye video created: " .. output_video)
end

return M
