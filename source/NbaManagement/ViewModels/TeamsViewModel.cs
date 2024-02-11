using NbaManagement.Mvvm.Navigation;
using NbaManagement.Services;
using NbaManagement.ViewModels.Base;
using NbaManagement.Database;
using NbaManagement.Mvvm.Input;
using System.Collections.Generic;
using System.Linq;
using NbaManagement.Models;
using NbaManagement.Enums;

namespace NbaManagement.ViewModels
{
    public class TeamsViewModel : TitledViewModel
    {
        public IEnumerable<TeamsByDivisionByConference> TeamsByDivisionByConferences { get; }

        #region Commands
        public IRelayCommand<Team> NavigateToTeamDetailCommand { get; }

        public IRelayCommand<Team> NavigateToTeamRosterCommand { get; }
        
        public IRelayCommand<Team> NavigateToTeamMatchupCommand { get; }
        
        public IRelayCommand<Team> NavigateToTeamLineupCommand { get; }
        #endregion

        public TeamsViewModel(INavigationService navigationService, TeamService teamService, SeasonService seasonService)
        {
            Title = "Teams Main";

            NavigateToTeamDetailCommand = new RelayCommand<Team>(team =>
                navigationService.Navigate(new TeamDetailViewModel(seasonService, team)));

            NavigateToTeamRosterCommand = new RelayCommand<Team>(team =>
                navigationService.Navigate(new TeamDetailViewModel(seasonService, team, TeamDetail.Roster)));

            NavigateToTeamMatchupCommand = new RelayCommand<Team>(team =>
                navigationService.Navigate(new TeamDetailViewModel(seasonService, team, TeamDetail.Matchup)));

            NavigateToTeamLineupCommand = new RelayCommand<Team>(team =>
                navigationService.Navigate(new TeamDetailViewModel(seasonService,team, TeamDetail.Lineup)));

            TeamsByDivisionByConferences = teamService
                .GetConferences()
                .Select(conference => new TeamsByDivisionByConference
                (
                    conference,
                    teamService
                        .GetDivisions()
                        .Where(division => division.Conference == conference)
                        .Select(division => new TeamsByDivision(division, division.Teams.OrderBy(team => team.Name).ToList()))
                        .ToList()
                ));
        }
    }
}