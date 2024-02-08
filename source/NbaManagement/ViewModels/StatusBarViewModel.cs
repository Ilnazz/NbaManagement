using System;

namespace NbaManagement.ViewModels
{
    public class StatusBarViewModel
    {
        public int SeasonStartYear => DateTime.Now.Date.Year - 1;

        public int SeasonEndYear => SeasonStartYear + 1;

        public int NbaAge => DateTime.Now.Year - 1946;
    }
}