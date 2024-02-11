using NbaManagement.Database;
using NbaManagement.Services;
using System;

namespace NbaManagement.ViewModels
{
    public class StatusBarViewModel
    {
        private readonly SeasonService _seasonService;

        public StatusBarViewModel(SeasonService seasonService) => _seasonService = seasonService;

        public Season CurrentSeason => _seasonService.GetCurrentSeason();

        public int NbaAge => DateTime.Now.Year - 1946;
    }
}