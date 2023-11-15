using System;
using System.IO;

class CanaryFileMonitor
{
    static void Main()
    {
        string filePath = "C:\\path\\to\\your\\canary_file.txt";

        using (FileSystemWatcher watcher = new FileSystemWatcher())
        {
            watcher.Path = Path.GetDirectoryName(filePath);
            watcher.Filter = Path.GetFileName(filePath);

            watcher.Changed += OnChanged;
            watcher.Deleted += OnChanged;
            watcher.Renamed += OnChanged;

            watcher.EnableRaisingEvents = true;

            // Just used for testing, tbh remove this & change it into a service or somen
            Console.WriteLine("Monitoring canary file. Press 'Enter' to exit.");
            Console.ReadLine();
        }
    }

    private static void OnChanged(object source, FileSystemEventArgs e)
    {
        Console.WriteLine($"Canary file {e.ChangeType}: {e.FullPath}");
    }
}
