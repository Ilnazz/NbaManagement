using NbaManagement.Mvvm.Navigation;
using System.Collections.Generic;
using NbaManagement.Services;
using NbaManagement.ViewModels.Base;
using NbaManagement.Database;

namespace NbaManagement.ViewModels
{
    public class TeamsViewModel : TitledViewModel
    {
        public IEnumerable<Team> Teams { get; }

        public TeamsViewModel(INavigationService navigationService, TeamService teamService)
        {
            Title = "Teams Main";
        }
    }
}