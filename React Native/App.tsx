import { NativeBaseProvider } from "native-base";
import Drawer from "./src/routes/drawer";

export default function App() {
  return (
    <NativeBaseProvider>
      <Drawer />
    </NativeBaseProvider>
  );
}
