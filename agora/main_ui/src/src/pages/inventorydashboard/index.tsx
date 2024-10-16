import React from 'react';
import {
  FluentProvider,
  webLightTheme,
  makeStyles,
  tokens,
  Text,
  MessageBar,
  MessageBarTitle,
  MessageBarBody,
  MessageBarActions,
  Button,
} from "@fluentui/react-components";
import { DismissRegular } from "@fluentui/react-icons";
import Header from '../../components/SuiteHeader';
import SideMenu from "../../components/SideMenu";
import { Default as Banner } from "../../components/Banner";
import Cards from "../../components/Cards";
import Greetings from "../../components/Greetings";
import Greeting from "../../components/Greeting";
import InventoryStatus from "../../components/InventoryStatus";
import Health from "../../components/Health";
import { IStackProps, IStackTokens, Stack } from "@fluentui/react";
import NumberOfProductsManufacturedGraph from "../../components/NumberOfProductsManufacturedGraph";
import ProductInventoryGraph from "../../components/ProductInventoryGraph";
import StoreOrdersGraph from "../../components/StoreOrdersGraph";
import OEEPerPlantGraph from "../../components/OEEPerPlantGraph";
import OEEByProductsGraph from "../../components/OEEByProductsGraph";
import InPageFilter from "../../components/InPageFilter";
import { CopilotProvider } from "@fluentui-copilot/react-copilot";
import logo from './logo.svg';
import '../../App.css';
import Cameras from '../../components/Cameras';
const Main = (props: IStackProps) => (
    <Stack horizontal grow={1} disableShrink {...props} />
  );

const themedMediumStackTokens: IStackTokens = {
childrenGap: "m",
padding: "m",
};

const useStyles = makeStyles({
  frameheader: {
      color: tokens.colorNeutralForeground1Static,
      fontFamily: "var(--Font-family-Base, 'Segoe UI')",
      fontSize: "16.849px",
      fontStyle: "normal",
      fontWeight: "600",
      lineHeight: "23.589px", /* 140% */    
    },
    container: {
      gap: "36px",
      marginBottom: "13.48px"
    }
});

const InventoryDashboard = () => {
  const classes  = useStyles();
    return (
        <FluentProvider theme={webLightTheme}>
        <CopilotProvider mode='sidecar'>
          <Header />
          <Main>
          <Stack.Item>
              <SideMenu />
          </Stack.Item>
          <Stack.Item grow={3}>
            <Stack tokens={themedMediumStackTokens}>
              <Stack>
                <Text className={classes.frameheader}>Inventory</Text>
              </Stack>              
              <Stack>
                <InPageFilter />
              </Stack>              
              <Stack id='LineAndBarCharts'>
                <Stack className={classes.container} horizontal>
                <ProductInventoryGraph />
                <StoreOrdersGraph />
                </Stack>                  
              </Stack>

              <Stack id='PieCharts'>
                <Stack className={classes.container} horizontal>
                <NumberOfProductsManufacturedGraph />
                <OEEPerPlantGraph />
                <OEEByProductsGraph />
                </Stack>                  
              </Stack>
            </Stack>
          </Stack.Item>
          </Main>
        </CopilotProvider>
      </FluentProvider>
    );
  };
  
  export default InventoryDashboard;