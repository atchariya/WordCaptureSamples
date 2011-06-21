using WordCapture;

namespace $rootnamespace$ 
{
	class WordCaptureSample
	{
		WCaptureX capture = ComFactory.Instance.NewWCaptureX();
		WMonitorX monitor = ComFactory.Instance.NewWMonitorX();
		
		private void InitWordCaptureObjects()
		{
			capture = ComFactory.Instance.NewWCaptureX();
			monitor = ComFactory.Instance.NewWMonitorX();
		}

        public WordCaptureSample()
        {
            InitWordCaptureObjects();

            //start using the WordCapture API
            //if you need help read the documentation here http://wordcapturex.deskperience.com/
            //or use Demo.exe visual tool to generate code and speed up development

        }
	}
}