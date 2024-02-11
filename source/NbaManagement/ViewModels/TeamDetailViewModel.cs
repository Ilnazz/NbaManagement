using NbaManagement.Database;
using NbaManagement.Enums;
using NbaManagement.Mvvm.Input;
using NbaManagement.Services;
using NbaManagement.ViewModels.Base;
using System.Collections.Generic;
using System.Linq;

namespace NbaManagement.ViewModels
{
    public class TeamDetailViewModel : TitledViewModel
    {
        #region Properties
        public int ShownTeamDetailIndex { get; }

        public Team Team { get; }

        public IEnumerable<Team_Player> PlayersInTeam =>
            Team.Team_Player.Where(teamPlayer => teamPlayer.Season == SelectedSeason);

        public IEnumerable<Matchup> Matchups =>
            Team.HomeMatchups.Where(matchup => matchup.Season == SelectedSeason);

        public IEnumerable<Season> Seasons { get; }

        private Season _selectedSeason;
        public Season SelectedSeason
        {
            get => _selectedSeason;
            set => SetProperty(ref _selectedSeason, value);
        }

        public PlayerPositionViewModel PowerForwardPositionViewModel { get; }

        public PlayerPositionViewModel ShootingGuardPositionViewModel { get; }

        public PlayerPositionViewModel CenterPositionViewModel { get; }

        public PlayerPositionViewModel SmallForwardPositionViewModel { get; }

        public PlayerPositionViewModel PointGuardPositionViewModel { get; }
        #endregion

        public IRelayCommand SearchCommand { get; }

        public TeamDetailViewModel
        (
            SeasonService seasonService,
            PlayerPositionService playerPositionService,
            Team team,
            TeamDetail? shownTeamDetail = null)
        {
            Title = "Team Detail";

            Team = team;
            ShownTeamDetailIndex = shownTeamDetail.HasValue ? (int)shownTeamDetail.Value : -1;

            Seasons = seasonService.GetSeasons();
            SelectedSeason = seasonService.GetCurrentSeason();

            PowerForwardPositionViewModel = new PlayerPositionViewModel(playerPositionService.PowerForward, team);
            ShootingGuardPositionViewModel = new PlayerPositionViewModel(playerPositionService.ShootingGuard, team);
            CenterPositionViewModel = new PlayerPositionViewModel(playerPositionService.Center, team);
            SmallForwardPositionViewModel = new PlayerPositionViewModel(playerPositionService.SmallForward, team);
            PointGuardPositionViewModel = new PlayerPositionViewModel(playerPositionService.PointGuard, team);

            SearchCommand = new RelayCommand(() =>
            {
                OnPropertyChanged(nameof(PlayersInTeam));
                OnPropertyChanged(nameof(Matchups));
            });
        }
    }
}